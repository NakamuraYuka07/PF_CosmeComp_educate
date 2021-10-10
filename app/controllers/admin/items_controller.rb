class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @item_category = ItemCategory.all
  end

  def create
    @item = Item.new(item_params)
    @item.score = Language.get_data(item_params[:body])  #この行を追加
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
      redirect_to admin_item_path(@item)
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
