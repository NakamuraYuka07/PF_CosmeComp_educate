class Users::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
    @rank_items = Item.includes(:favorited_users).limit(5).sort { |a,b| b.favorited_users.size <=> a.favorited_users.size }
  end

  def show
    @item = Item.find(params[:id])
    @categories = ItemCategory.all
    @comment = Comment.new
  end
end
