class Users::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(10)
    @rank_items = Item.includes(:favorited_users).limit(5).sort { |a,b| b.favorited_users.size <=> a.favorited_users.size }
    # @rank_items = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(5).pluck(:item_id))
    @categories = ItemCategory.all
  end

  def show
    @item = Item.find(params[:id])
    @categories = ItemCategory.all
    @comment = Comment.new
  end
end
