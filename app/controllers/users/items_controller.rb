class Users::ItemsController < ApplicationController
  def index
    @items = Item.all
    @categories = ItemCategory.all
  end
  
  def show
    @item = Item.find(params[:id])
    @categories = ItemCategory.all
    @comment = Comment.new
  end
  
  
end
