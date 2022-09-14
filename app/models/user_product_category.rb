class UserProductCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category
end
