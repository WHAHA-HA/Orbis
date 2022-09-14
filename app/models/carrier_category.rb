class CarrierCategory < ActiveRecord::Base
  has_many :user_carrier_categories
  has_many :posts
end
