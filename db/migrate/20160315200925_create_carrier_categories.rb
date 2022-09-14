class CreateCarrierCategories < ActiveRecord::Migration
  def change
    create_table :carrier_categories do |t|
      t.string :name,       null: false, default: ''
    end
  end
end
