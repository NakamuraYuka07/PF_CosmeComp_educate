class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page]).per(5)
  end

  def new
    @item = Item.new
    @item_category = ItemCategory.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      @item = Item.find(params[:id])
      @item_category = ItemCategory.all
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :explanation, :component, :status, :item_category_id, :rate)
  end
end
