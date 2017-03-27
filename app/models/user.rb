class User < ApplicationRecord
  has_secure_password
  has_one :location

  has_one :active_match, -> { includes :receiver }, class_name: 'Match', foreign_key: 'sender_id'
  has_one :active_love, class_name: 'User', through: 'active_match', source: 'receiver'

  has_one :passive_match, -> { includes :sender }, class_name: 'Match', foreign_key: 'receiver_id'
  has_one :passive_love, class_name: 'User', through: 'passive_match', source: 'sender'

  has_many :sent_messages, -> { includes :receiver }, class_name: 'Message', foreign_key: 'sender_id'
  has_many :sent, class_name: 'User', through: 'sent_messages', source: 'receiver'

  has_many :received_messages, -> { includes :sender }, class_name: 'Message', foreign_key: 'receiver_id'
  has_many :received, class_name: 'User', through: 'received_messages', source: 'sender'
end
