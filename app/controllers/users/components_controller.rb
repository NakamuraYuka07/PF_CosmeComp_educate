class Users::ComponentsController < ApplicationController
  def index
    @components = Component.all
    @categories = CompCategory.all
  end
  
  def show
    @component = Component.find(params[:id])
    @categories = CompCategory.all
  end
end
