class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  layout 'application_admin'

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    # users = User.joins(:carrier_categories, :license_categories, :news_categories, :product_categories)
    @post = Post.new(post_params)
    @post.skip_schedule = true

    respond_to do |format|
      if @post.save

        post_to_social_accounts @post

        format.html { redirect_to admin_posts_path, notice: 'Posted Successfully!' }
        format.json { render json: admin_posts_path, status: :created, location: @post }
      else
        format.html { render action: "new", notice: @post.errors }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_schedule
    @post = Post.new
  end

  def create_schedule
    @post = Post.new(schedule_post_params)
    @post.skip_schedule = false

    respond_to do |format|
      if @post.save

        schedule_at = DateTime.new(
            params[:post]["schedule_at(1i)"].to_i,
            params[:post]["schedule_at(2i)"].to_i,
            params[:post]["schedule_at(3i)"].to_i,
            params[:post]["schedule_at(4i)"].to_i,
            params[:post]["schedule_at(5i)"].to_i
        )
        scheduler = Rufus::Scheduler.singleton
        scheduler.at schedule_at.to_s do
        # do something at a given point in time

          post_to_social_accounts @post
        end
        format.html { redirect_to admin_posts_path, notice: 'Posted Successfully!' }
        format.json { render json: admin_posts_path, status: :created, location: @post }
      else
          format.html { render action: "new_schedule", notice: @post.errors }
          format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: 'One Post removed successfully!'
  end
  private

  def post_params
    params.require(:post).permit(:content, :carrier_category_id, :license_category_id, :news_category_id,
                                 :product_category_id, :twitter, :facebook, :linkedin)
  end
  def schedule_post_params
    params.require(:post).permit(:content, :carrier_category_id, :license_category_id, :news_category_id,
                                 :product_category_id, :twitter, :facebook, :linkedin, :schedule_at)
  end

  def post_to_social_accounts post
    # users1 = User.joins(:carrier_categories).where(carrier_categories.id == post.carrier_category_id)
    users = User.joins("left outer JOIN user_carrier_categories ON user_carrier_categories.user_id = users.id")
                .joins("left outer JOIN carrier_categories ON carrier_categories.id = user_carrier_categories.carrier_category_id")
                .joins("left outer JOIN user_license_categories ON user_license_categories.user_id = users.id")
                .joins("left outer JOIN license_categories ON license_categories.id = user_license_categories.license_category_id")
                .joins("left outer JOIN user_news_categories ON user_news_categories.user_id = users.id")
                .joins("left outer JOIN news_categories ON news_categories.id = user_news_categories.news_category_id")
                .joins("left outer JOIN user_product_categories ON user_product_categories.user_id = users.id")
                .joins("left outer JOIN product_categories ON product_categories.id = user_product_categories.product_category_id")
                .where("carrier_categories.id = ? or license_categories.id = ? or news_categories.id = ? or product_categories.id = ?",
                       post.carrier_category_id, post.license_category_id, post.news_category_id, post.product_category_id)
    users.each do |user|
      if post.facebook && user.user_facebook_profile.present?
        begin
          @oauth = Koala::Facebook::OAuth.new(ENV["facebook_app_id"], ENV["facebook_secret"], 'http://localhost:3000')
          @oauth.url_for_oauth_code(:permissions => "publish_stream")
          @auth_token = @oauth.exchange_access_token(user.user_facebook_profile.token)

          @user_graph = Koala::Facebook::API.new(@auth_token)

          user.user_facebook_profile.token = @auth_token
          user.user_facebook_profile.save

          result = @user_graph.put_wall_post(post.content)
        rescue Koala::Facebook::APIError => exc
          logger.error("Problems posting to Facebook Wall..."+self.inspect+" "+exc.message)
        end
      end

      if post.twitter && user.user_twitter_profile.present?
        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV["twitter_api_key"]
          config.consumer_secret     = ENV["twitter_secret"]
          config.access_token        = user.user_twitter_profile.token
          config.access_token_secret = user.user_twitter_profile.secret
        end

        begin
          client.update(post.content)
        rescue Twitter::Error
          logger.error("Twitter says you cannot post same twice")
        rescue Exception
          logger.error("Problems to tweet")
        end
      end

      if post.linkedin && user.user_linkedin_profile.present?
        config = {
            :request_token_path => "/uas/oauth/requestToken?scope=r_basicprofile+w_share",
            :access_token_path  => "/uas/oauth/accessToken",
            :authorize_path     => "/uas/oauth/authorize",
            :api_host           => "https://api.linkedin.com",
            :auth_host          => "https://www.linkedin.com"
        }
        client = LinkedIn::Client.new(ENV["linkedin_app_id"], ENV["linkedin_secret"], config)
        client.authorize_from_access(user.user_linkedin_profile.token, user.user_linkedin_profile.secret)

        begin
          @share_result = client.add_share(:comment => post.content)
        rescue
          @share_result = nil
        end
      end
    end
  end
end
