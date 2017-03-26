class Location < ApplicationRecord
  belongs_to :user
  acts_as_mappable :auto_geocode=>true
end
