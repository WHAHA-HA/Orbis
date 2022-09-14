class ChangeColumnToUserCarrierCategory < ActiveRecord::Migration
  def change
    change_column :user_carrier_categories, :carrier_category_id, :integer, null:false
  end
end
