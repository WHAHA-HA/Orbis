class CreateUserProductCategories < ActiveRecord::Migration
  def change
    create_table :user_product_categories do |t|
      t.integer :user_id,              null: false, default: 0
      t.integer :product_category_id,       null: false, default: 0
    end
  end
end
