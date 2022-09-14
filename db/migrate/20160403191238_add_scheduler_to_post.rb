class AddSchedulerToPost < ActiveRecord::Migration
  def change
    remove_column :users, :schedule_at
    add_column :posts, :schedule_at, :timestamp
  end
end
