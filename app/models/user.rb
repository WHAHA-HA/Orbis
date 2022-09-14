class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin]

  has_attached_file :avatar,
                    styles: { medium: "600x600>", thumb: "300x300>" },
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "users/:id/:filename",
                    default_url: "admin/missing.png"

  validates_attachment :avatar,
                       content_type: { content_type: /\Aimage\/.*\Z/ }

  has_many :user_carrier_categories, dependent: :destroy
  accepts_nested_attributes_for :user_carrier_categories
  has_many :carrier_categories, through:  :user_carrier_categories

  has_many :user_product_categories, dependent: :destroy
  accepts_nested_attributes_for :user_product_categories
  has_many :product_categories, through:  :user_product_categories

  has_many :user_news_categories, dependent: :destroy
  accepts_nested_attributes_for :user_news_categories
  has_many :news_categories, through:  :user_news_categories

  has_many :user_license_categories, dependent: :destroy
  accepts_nested_attributes_for :user_license_categories
  has_many :license_categories, through:  :user_license_categories

  has_one :user_facebook_profile, dependent: :destroy
  has_one :user_twitter_profile, dependent: :destroy
  has_one :user_linkedin_profile, dependent: :destroy
end
