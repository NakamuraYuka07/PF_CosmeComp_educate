class Users::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    #いいね順でランキングを表示５位か１０位で表示したい。調べる
    @rank_items = Item.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @categories = ItemCategory.all
  end
  
  def show
    @item = Item.find(params[:id])
    @categories = ItemCategory.all
    @comment = Comment.new
  end
  
end
