class CreateUserCarrierCategories < ActiveRecord::Migration
  def change
    create_table :user_carrier_categories do |t|
      t.integer :user_id,              null: false, default: 0
      t.integer :carrier_category_id,       null: false, default: 0
    end
  end
end
