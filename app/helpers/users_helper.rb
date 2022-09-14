module UsersHelper
  def active_class action
    if params[:action] == action
      'active'
    else '' end
  end

  def category_active_class category, class_name
    if class_name == 'license'
      UserLicenseCategory.where(license_category_id: category.id, user_id: current_user.id).first.blank? ? '' : 'active'
    end
  end

  def user_category_id category, class_name
    result = []
    if class_name == 'license'
      category_data = UserLicenseCategory.where(license_category_id: category.id, user_id: current_user.id).first
    elsif class_name == 'product'
      category_data = UserProductCategory.where(product_category_id: category.id, user_id: current_user.id).first
    elsif class_name == 'carrier'
      category_data = UserCarrierCategory.where(carrier_category_id: category.id, user_id: current_user.id).first
    else
      category_data = UserNewsCategory.where(news_category_id: category.id, user_id: current_user.id).first
    end

    result[0] = category_data.blank? ? '' : 'active'
    result[1] = category_data.blank? ? '' : category_data.id

    result
  end
end

