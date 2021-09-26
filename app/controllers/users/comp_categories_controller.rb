class Users::CompCategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @all_components = Component.all(status: true)
    @components = @all_components.page(params[:page]).per(10).reverse_order
    @categories = CompCategory.all
  end

  # indexがidを持っていないので一度経由するためにsearchアクションを作成
  def search
    @comp_category = CompCategory.find(params[:id])
    @all_components = Component.where(status: true, comp_category_id: @comp_category.id)
    @components = @all_components.page(params[:page]).per(10).reverse_order
    @categories = CompCategory.all
    # renderでそのままindexにとばす
    render :index
  end
end
