class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :sender, class_name: 'User'
  belongs_to :match_room

  default_scope { order(created_at: :asc) }
end
