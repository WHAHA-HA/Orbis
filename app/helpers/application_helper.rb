module ApplicationHelper
  def page_class_active controller
    params[:controller].to_s == controller ? 'active' : ''
  end

  def get_default_avatar
    if current_user.default_avatar.to_i == 1 && current_user.user_facebook_profile.present?
      current_user.user_facebook_profile.image
    elsif current_user.default_avatar.to_i == 2 && current_user.user_twitter_profile.present?
      current_user.user_twitter_profile.image
    elsif current_user.default_avatar.to_i == 3 && current_user.user_linkedin_profile.present?
      if current_user.user_linkedin_profile.image == nil
        asset_url('admin/missing.png')
      else
        current_user.user_linkedin_profile.image
      end
    else  asset_url('admin/missing.png')
    end
  end

  def avatar_active_class source_name
    if current_user.default_avatar == 1 && source_name == 'facebook'
      'active'
    elsif current_user.default_avatar == 2 && source_name == 'twitter'
      'active'
    elsif current_user.default_avatar == 3 && source_name == 'linkedin'
      'active'
    else
      ''
    end
  end
end
