class AddColumnsToPost < ActiveRecord::Migration
  def change
    add_column :users, :schedule_at, :timestamp
  end
end
