class ChangeColumn1ToUserCarrierCategory < ActiveRecord::Migration
  def change
    remove_column :user_carrier_categories, :carrier_category_id
    add_column :user_carrier_categories, :carrier_category_id, :integer, null:false
  end
end
