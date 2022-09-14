class AddDefaultProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :default_avatar, :integer
  end
end
