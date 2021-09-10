class Admin::ComponentsController < ApplicationController
   before_action :authenticate_admin!

  def index
    @components = Component.all
  end
  
  def show
    @component = Component.find(params[:id])
  end
  
  def new
    @component = Component.new
    @comp_category = CompCategory.all
  end

  def create
    component = Component.new(component_params)
    component.save!
    redirect_to admin_components_path
  end
  
  def edit
    @component = Component.find(params[:id])
    @comp_category = CompCategory.all
  end

  def update
    @component = Component.find(params[:id])
    @component.update(component_params)
    redirect_to admin_components_path
  end
  
  private
  def component_params
    params.require(:component).permit(:name, :explanation, :status, :comp_category_id)
  end

end
