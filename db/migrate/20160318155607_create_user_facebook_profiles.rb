class CreateUserFacebookProfiles < ActiveRecord::Migration
  def change
    create_table :user_facebook_profiles do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
end
