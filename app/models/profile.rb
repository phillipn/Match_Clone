class Profile < ApplicationRecord
  belongs_to :user, optional: true
end
