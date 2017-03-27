class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :sender, class_name: 'User'
  belongs_to :match_room
end
