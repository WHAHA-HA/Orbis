class ChangelinkdlnToPost < ActiveRecord::Migration
  def change
    rename_column :posts, :linkdln, :linkedin
  end
end
