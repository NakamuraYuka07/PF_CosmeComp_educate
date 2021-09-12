class Admin::UsersController < ApplicationController
    before_action :configure_permitted_parameters, if: :devise_controller?
  
  def index
    @users = User.all
    #@users = User.all.order(:id)
    @userr = User.page(params[:page]).per(10)
  end
  
  def show
    @user = User.find(params[:id])
  end 
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end
  
  protected
  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :cust_postal_code, :cust_address, :phone_number, :email, :is_deleted)
  end
end
