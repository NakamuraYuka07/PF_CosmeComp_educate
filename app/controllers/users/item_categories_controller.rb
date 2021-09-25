class Users::ItemCategoriesController < ApplicationController
  def index
    @all_items = Item.all(status: true)
    @items = @all_items.page(params[:page]).per(8).reverse_order
    @categories = ItemCategory.all
  end

  # indexがidを持っていないので一度経由するためにsearchアクションを作成
  def search
    @item_category = ItemCategory.find(params[:id])
    @all_items = Item.where(status: true, item_category_id: @item_category.id)
    @items = @all_items.page(params[:page]).per(10).reverse_order
    @categories = ItemCategory.all
    # renderでそのままindexにとばす
    render :index
    
  end

end
