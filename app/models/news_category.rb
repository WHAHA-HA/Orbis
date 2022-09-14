class NewsCategory < ActiveRecord::Base
  has_many :user_news_categories
  has_many :posts
end
