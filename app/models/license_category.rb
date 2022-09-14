class LicenseCategory < ActiveRecord::Base
  has_many :user_license_categories
end
