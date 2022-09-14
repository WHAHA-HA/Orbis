class UserNewsCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :news_category
end
