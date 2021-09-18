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
    p item_params
    @item = Item.new(item_params)
    p @item
    if @item.save!
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @item_category = ItemCategory.all
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
