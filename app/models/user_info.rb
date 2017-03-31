class UserInfo < ApplicationRecord
  belongs_to :user, optional: true
  validates :personality,  inclusion: { in: %w(ESTJ ISTJ INTJ ISTP ESTP ENTJ INTP ENFJ INFJ ISFJ ISFP ENTP ESFJ ESFP ENFP INFP), message: "%{value} is not a valid personaility" }
  validates :personality, :max_age,:min_age,:hair, :eye, :education,:kids, :date_kids, :want_kids, :polotics,:date_politics,:smoke, :date_smoke, :tattoo, :date_tattoo,:religion, :date_religion, :pet, :date_pet, :birthday, presence:true
  validates :hair,  inclusion: { in: %w(Blonde Red Brunette Grey Other), message: "%{value} is not a valid hair color" }
  validates :eye,  inclusion: { in: %w(Blue Brown Gray Hazel Green Other), message: "%{value} is not a valid eye color" }
  validates :education,  inclusion: { in: %w(High\ School Undergraduate\ Degree Masters\ Degree Doctorate), message: "%{value} is not a valid education level" }
  validates :religion,  inclusion: { in: %w(Christianity Islam Judaism Buddhism Hinduism Atheistism Mormonism Other), message: "%{value} is not a valid religion" }
  validates :politics,  inclusion: { in: %w(Conservative Liberal Moderate), message: "%{value} is not a valid political view" }
  validates_numericality_of :max_age
  validates_numericality_of :max_age, :greater_than => :min_age
  validate :birthday_cannot_be_in_the_future

  def birthday_cannot_be_in_the_future
    if birthday.present? && birthday > Date.today
      errors.add(:birthday, "can't be in the future")
    end
  end
  
end
