class Admin::UsersController < ApplicationController
    before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      @user = User.find(params[:id])
      render:edit
    end
  end

  protected
  def user_params
    params.require(:user).permit(:nickname, :birth_year, :birth_month, :birth_day, :age, :skin_type, :is_deleted)
  end
end
