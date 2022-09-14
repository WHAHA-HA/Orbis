class UserCarrierCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :carrier_category
end

