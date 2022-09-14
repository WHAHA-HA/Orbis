class CreateUserLicenseCategories < ActiveRecord::Migration
  def change
    create_table :user_license_categories do |t|
      t.integer :user_id,              null: false, default: 0
      t.integer :license_category_id,       null: false, default: 0
    end
  end
end
