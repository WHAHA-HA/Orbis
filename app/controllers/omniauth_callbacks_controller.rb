class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @facebook_profile = UserFacebookProfile.from_omniauth(request.env["omniauth.auth"])

    if @facebook_profile.persisted?
      @facebook_profile.user_id = current_user.id
      @facebook_profile.save
    end
    #   sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    #   set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    # else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to accounts_path, notice: 'Connected to Facebook successfully!'
    # end
  end

  def failure
    redirect_to accounts_path, notice: 'Failed!'
  end

  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @twitter_profile = UserTwitterProfile.from_omniauth(request.env["omniauth.auth"])

    if @twitter_profile.persisted?
      @twitter_profile.user_id = current_user.id
      @twitter_profile.save
    end
    #   sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    #   set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    # else
    session["devise.twitter_data"] = request.env["omniauth.auth"]
    redirect_to accounts_path, notice: 'Connected to Twitter successfully!'
    # end
  end

  def linkedin
    @linkedin_profile = UserLinkedinProfile.from_omniauth(request.env["omniauth.auth"])

    if @linkedin_profile.persisted?
      @linkedin_profile.user_id = current_user.id
      @linkedin_profile.save
    end
    #   sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    #   set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    # else
    session["devise.linkedin_data"] = request.env["omniauth.auth"]
    redirect_to accounts_path, notice: 'Connected to Linkedin successfully!'
  end
end
