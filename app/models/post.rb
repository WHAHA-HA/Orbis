class Post < ActiveRecord::Base
  belongs_to :carrier_category
  belongs_to :license_category
  belongs_to :news_category
  belongs_to :product_category

  attr_accessor :skip_schedule

  def user_carrier_category
    carrier_category.user_carrier_categories
  end

  def user_license_category
    license_category.user_license_categories
  end

  validates :carrier_category_id, :license_category_id, :news_category_id, :product_category_id, presence: true
  validates :content, length: { in: 2..144 }, presence: true, uniqueness: true
  validates_time :schedule_at, presence: true, on_or_after: DateTime.now, unless: :skip_schedule

end
