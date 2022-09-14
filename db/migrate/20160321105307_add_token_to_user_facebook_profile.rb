class AddTokenToUserFacebookProfile < ActiveRecord::Migration
  def change
    add_column :user_facebook_profiles, :token, :string
  end
end
