class AccountsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user_licenses = UserLicenseCategory.where(user_id: current_user.id)
    @user_news = UserNewsCategory.where(user_id: current_user.id)
    @user_products = UserProductCategory.where(user_id: current_user.id)
    @user_carriers = UserCarrierCategory.where(user_id: current_user.id)
  end

  def update_setting
    # if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
    #     params[:user].delete(:password)
    #     params[:user].delete(:password_confirmation)
    # end
    if current_user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in current_user, :bypass => true
      redirect_to accounts_path, notice: 'Your account updated successfully!'
    else
      render "index"
    end
  end

  def set_default_profile
    current_user.default_avatar = params[:avatar_index].to_i
    if current_user.save
      render json: {result: 'success'}, status: :ok
    else
      render json: {error: 'failed'}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
