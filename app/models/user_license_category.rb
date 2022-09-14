class UserLicenseCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :license_category
end
