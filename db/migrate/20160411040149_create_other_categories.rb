class CreateOtherCategories < ActiveRecord::Migration
  def change
    create_table :other_categories do |t|
      t.string :category_type
      t.string :category_name
      t.integer :user_id
      t.timestamps
    end
  end
end
