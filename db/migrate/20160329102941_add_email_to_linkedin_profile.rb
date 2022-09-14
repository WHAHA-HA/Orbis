class AddEmailToLinkedinProfile < ActiveRecord::Migration
  def change
    add_column :user_linkedin_profiles, :email, :string
  end
end
