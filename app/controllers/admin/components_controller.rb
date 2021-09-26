class Admin::ComponentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @components = Component.page(params[:page]).per(10)
  end

  def show
    @component = Component.find(params[:id])
  end

  def new
    @component = Component.new
    @comp_category = CompCategory.all
  end

  def create
    @component = Component.new(component_params)
    if @component.save
      redirect_to admin_components_path
    else
    @comp_category = CompCategory.all
    @component = Component.new
      render :new
    end
  end

  def edit
    @component = Component.find(params[:id])
    @comp_category = CompCategory.all
  end

  def update
    @component = Component.find(params[:id])
    @comp_category = CompCategory.all
    if @component.update(component_params)
      redirect_to admin_component_path(@component)
    else
      @component = Component.find(params[:id])
      @comp_category = CompCategory.all
      render :edit
    end
  end

  private
  
  def component_params
    params.require(:component).permit(:name, :explanation, :status, :comp_category_id)
  end
end
