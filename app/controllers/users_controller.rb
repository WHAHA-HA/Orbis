class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # @form = UserCategoryForm.new current_user
  end

  def edit_category
    @form = current_user
    @license_categories = LicenseCategory.includes(:user_license_categories)
  end
  def update_category
    # current_user.user_carrier_categories.build unless current_user.user_carrier_categories.present?

    current_user.carrier_category_ids = params[:carrier_category_ids]
    current_user.license_category_ids = params[:license_category_ids]
    current_user.news_category_ids = params[:news_category_ids]
    current_user.product_category_ids = params[:product_category_ids]
    current_user.save
    # @form.carrier_categories.save
    redirect_to edit_category_users_path, notice: 'Categories saved successfully!'
  end

  def edit_account

  end

  def set_user_category
    category = params[:category].to_s
    category_id = params[:category_id].to_i
    user_category_id = params[:user_category_id].to_i
    if category == 'license'
      if user_category_id != 0
        category_data = UserLicenseCategory.find(user_category_id).destroy
        user_category_id = 0
      else
        category_data = UserLicenseCategory.where(license_category_id: category_id, user_id: current_user.id).first_or_create
        user_category_id = category_data.id
      end
    elsif category == 'product'
      if user_category_id != 0
        category_data = UserProductCategory.find(user_category_id).destroy
        user_category_id = 0
      else
        category_data = UserProductCategory.where(product_category_id: category_id, user_id: current_user.id).first_or_create
        user_category_id = category_data.id
      end
    elsif category == 'carrier'
      if user_category_id != 0
        category_data = UserCarrierCategory.find(user_category_id).destroy
        user_category_id = 0
      else
        category_data = UserCarrierCategory.where(carrier_category_id: category_id, user_id: current_user.id).first_or_create
        user_category_id = category_data.id
      end
    else
      if user_category_id != 0
        category_data = UserNewsCategory.find(user_category_id).destroy
        user_category_id = 0
      else
        category_data = UserNewsCategory.where(news_category_id: category_id, user_id: current_user.id).first_or_create
        user_category_id = category_data.id
      end
    end
    if category_data
      render json: {result: user_category_id}, status: :ok
    else
      render json: {error: 'failed'}, status: :unprocessable_entity
    end
  end

  def store_other_category
    type = params[:type].to_s
    data = params[:data].to_s
    other_category = OtherCategory.create(
           category_type: type,
           category_name: data,
           user_id: current_user.id
    )
    if other_category
      render json: {result: 'success'}, status: :ok
    else
      render json: {error: 'failed'}, status: :unprocessable_entity
    end
  end

  def terms_and_conditions

  end

  private

    def category_params
    # params.require(:user).permit(user_carrier_categories_attributes:[:carrier_category_id])
    params.require(:user).permit(user_carrier_categories:[:carrier_category_id => []])
  end

end
