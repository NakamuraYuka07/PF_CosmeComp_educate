class Users::ComponentsController < ApplicationController
  def index
    @components = Component.page(params[:page]).per(10)
    @categories = CompCategory.all
  end
  
  def show
    @component = Component.find(params[:id])
    @categories = CompCategory.all
  end
end
