class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user

    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)  # ログイン中のユーザーのお気に入りのitem_idカラムを取得
    @favorite_list = Item.find(favorites)  # itemsテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      @user = current_user
      render :edit
    end
  end

  def check
  end

  def hide
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  protected

  def user_params
     params.require(:user).permit(:nickname, :birth_year, :birth_month, :birth_day, :age, :skin_type, :is_deleted, :profile_image)
  end
end
