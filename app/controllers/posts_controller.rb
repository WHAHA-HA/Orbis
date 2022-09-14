class PostsController < ApplicationController
  def index
    # @posts = Post.joins("left JOIN carrier_categories ON carrier_categories.id = posts.carrier_category_id")
    #            .joins("left JOIN user_carrier_categories ON user_carrier_categories.carrier_category_id = carrier_categories.id")
    #            .joins("left JOIN license_categories ON license_categories.id = posts.license_category_id")
    #            .joins("left JOIN user_license_categories ON license_categories.id = user_license_categories.license_category_id")
    #            .joins("left JOIN news_categories ON news_categories.id = posts.news_category_id")
    #            .joins("left JOIN user_news_categories ON news_categories.id = user_news_categories.news_category_id")
    #            .joins("left JOIN product_categories ON product_categories.id = posts.product_category_id")
    #            .joins("left JOIN user_product_categories ON product_categories.id = user_product_categories.product_category_id")
    #            .where("user_carrier_categories.user_id = ? or user_license_categories.user_id = ? or user_news_categories.user_id = ? or user_product_categories.user_id = ?",
    #                     current_user.id, current_user.id, current_user.id, current_user.id)

    @posts = Post
               .joins("left JOIN user_carrier_categories ON user_carrier_categories.carrier_category_id = posts.carrier_category_id")
               .joins("left JOIN user_license_categories ON posts.license_category_id = user_license_categories.license_category_id")
               .joins("left JOIN user_news_categories ON posts.news_category_id = user_news_categories.news_category_id")
               .joins("left JOIN user_product_categories ON posts.product_category_id = user_product_categories.product_category_id")
               .where("user_carrier_categories.user_id = ? or user_license_categories.user_id = ? or user_news_categories.user_id = ? or user_product_categories.user_id = ?",
                        current_user.id, current_user.id, current_user.id, current_user.id).distinct
  end
end
