class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item_category = ItemCategory.all
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item)
  end

  def edit
    @item = Item.find(params[:id])
    @item_category = Item_category.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:item_image, :name, :explanation, :component, :status, :item_category_id)
  end
end
