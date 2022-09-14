class AddSocialColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :facebook, :boolean, default: false
    add_column :posts, :twitter, :boolean, default: false
    add_column :posts, :linkdln, :boolean, default: false
  end
end
