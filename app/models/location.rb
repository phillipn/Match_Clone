class Location < ApplicationRecord
  belongs_to :user, optional: true
  acts_as_mappable :auto_geocode=>true
end
