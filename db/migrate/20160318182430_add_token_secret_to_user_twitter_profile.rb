class AddTokenSecretToUserTwitterProfile < ActiveRecord::Migration
  def change
    add_column :user_twitter_profiles, :secret, :string
    add_column :user_twitter_profiles, :token, :string
  end
end
