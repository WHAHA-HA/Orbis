class CreateUserLinkedinProfiles < ActiveRecord::Migration
  def change
    create_table :user_linkedin_profiles do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :image
      t.string :password
      t.string :token
      t.string :secret
      t.references :user, index: true
      t.timestamps
    end
  end
end
