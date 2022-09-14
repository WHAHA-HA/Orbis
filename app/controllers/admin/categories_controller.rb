class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  layout 'application_admin'
  def index

  end

  def destroy
    if OtherCategory.find(params[:id]).destroy
      redirect_to admin_categories_path, notice: 'Category destroyed successfully!'
    else
      render 'index'
    end
  end
end
