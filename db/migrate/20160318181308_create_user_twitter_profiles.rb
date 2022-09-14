class CreateUserTwitterProfiles < ActiveRecord::Migration
  def change
    create_table :user_twitter_profiles do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :image
      t.string :password
      t.integer :user_id
      t.timestamps
    end
  end
end
