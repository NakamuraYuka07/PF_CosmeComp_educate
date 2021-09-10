class Admin::ComponentsController < ApplicationController
   before_action :authenticate_admin!

  def index
    @components = Component.all
  end
  
  def show
    @component = Component.find(params[:id])
  end

end
