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
    params.require(:user).permit(:nickname, :birth_year, :birth_month, :birth_day, :age, :skin_type, :is_deleted)
  end
end
