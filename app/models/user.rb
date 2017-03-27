class User < ApplicationRecord
  has_secure_password
  has_one :location

  has_one :active_match, -> { includes :receiver }, class_name: 'MatchRoom', foreign_key: 'sender_id'
  has_one :active_love, class_name: 'User', through: 'active_match', source: 'receiver'

  has_one :passive_match, -> { includes :sender }, class_name: 'MatchRoom', foreign_key: 'receiver_id'
  has_one :passive_love, class_name: 'User', through: 'passive_match', source: 'sender'
end
