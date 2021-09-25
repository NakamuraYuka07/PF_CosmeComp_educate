class Admin::CompCategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comp_category = CompCategory.new
    @comp_categories = CompCategory.all
  end

  def create
    @comp_category = CompCategory.new(comp_category_params)
    if @comp_category.save
      redirect_to admin_components_path
    else
      @comp_categories = CompCategory.all
      render :index
    end
  end

  def edit
    @comp_category = CompCategory.find(params[:id])
  end

  def update
    @comp_category = CompCategory.find(params[:id])
    if @comp_category.update(comp_category_params)
      redirect_to admin_comp_categories_path
    else
      @comp_category = CompCategory.find(params[:id])
      render :edit
    end
  end

  private

  def comp_category_params
    params.require(:comp_category).permit(:name)
  end
end
