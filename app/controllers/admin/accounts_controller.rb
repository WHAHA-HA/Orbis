class Admin::AccountsController < ApplicationController
  before_action :authenticate_admin!
  layout 'application_admin'

  def index
    @users = User.order(created_at: :desc)
  end

  def destroy
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.destroy
        format.html { redirect_to admin_accounts_path, notice: 'Removed user successfully!' }
        format.json { render json: admin_accounts_path, status: :created, location: @user }
      else
        format.html { render action: "index", notice: @user.errors }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
