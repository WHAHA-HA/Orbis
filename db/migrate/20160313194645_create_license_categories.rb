class CreateLicenseCategories < ActiveRecord::Migration
  def change
    create_table :license_categories do |t|
      t.string :name,       null: false, default: ''
    end
  end
end
