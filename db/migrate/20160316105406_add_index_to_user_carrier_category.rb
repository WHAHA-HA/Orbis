class AddIndexToUserCarrierCategory < ActiveRecord::Migration
  def change
    add_index :user_carrier_categories, [:user_id, :carrier_category_id], :name => 'my_index'
  end
end
