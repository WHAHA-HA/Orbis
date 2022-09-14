class ChangeFirstLastColumnsToUsers < ActiveRecord::Migration
  def change
    change_column :users, :first_name,  :string,     null: true, limit: 24
    change_column :users, :last_name,   :string,    null: true, limit: 24
  end
end
