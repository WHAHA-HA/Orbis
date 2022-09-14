class ProductCategory < ActiveRecord::Base
  has_many :user_product_categories
end
