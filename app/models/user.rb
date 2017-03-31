class User < ApplicationRecord
  has_secure_password
  has_one :location, dependent: :destroy
  has_one :user_info, dependent: :destroy
  has_one :profile, dependent: :destroy
  mount_uploader :picture, PictureUploader
  has_one :active_match, -> { includes :receiver }, class_name: 'MatchRoom', foreign_key: 'sender_id', dependent: :destroy
  has_one :active_love, class_name: 'User', through: 'active_match', source: 'receiver', dependent: :destroy

  has_one :passive_match, -> { includes :sender }, class_name: 'MatchRoom', foreign_key: 'receiver_id', dependent: :destroy
  has_one :passive_love, class_name: 'User', through: 'passive_match', source: 'sender', dependent: :destroy

  validates :first_name, presence:true, length: { minimum: 2 }
  validates :last_name, presence:true, length: { minimum: 2 }
  validates :sex, presence:true, inclusion: { in: %w(Male Female Other),
    message: "%{value} is not a valid sex" }
  validates :orientation, presence:true, inclusion: { in: %w(Bi-Sexual Straight Gay),
    message: "%{value} is not a valid orientation" }
  validates :email, presence:true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, uniqueness: true
  validate :picture_size
  validates :password, presence:true, length:{minimum:5}

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5 MB")
    end
  end
end
