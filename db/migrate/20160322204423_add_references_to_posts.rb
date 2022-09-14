class AddReferencesToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :carrier_category, index: true
    add_reference :posts, :license_category, index: true
    add_reference :posts, :product_category, index: true
    add_reference :posts, :news_category, index: true
    add_reference :posts, :admin, index: true
  end
end
