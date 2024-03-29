class Admin::ItemCategoriesController < ApplicationController
    before_action :authenticate_admin!

  def index
    @item_category = ItemCategory.new
    @item_categories = ItemCategory.all
  end

  def create
    @item_category = ItemCategory.new(item_category_params)
    if @item_category.save
      redirect_back(fallback_location: root_path)
    else
      @item_categories = ItemCategory.all
      render :index
    end
  end

  def edit
    @item_category = ItemCategory.find(params[:id])
  end

  def update
    @item_category = ItemCategory.find(params[:id])
    if @item_category.update(item_category_params)
      redirect_to admin_item_categories_path
    else
      render :edit
    end
  end

  private

  def item_category_params
    params.require(:item_category).permit(:name)
  end
end
