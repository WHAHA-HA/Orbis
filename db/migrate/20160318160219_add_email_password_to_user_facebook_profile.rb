class AddEmailPasswordToUserFacebookProfile < ActiveRecord::Migration
  def change
    add_column :user_facebook_profiles, :email, :string
    add_column :user_facebook_profiles, :password, :string
  end
end
