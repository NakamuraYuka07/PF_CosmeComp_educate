class Users::ComponentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @components = Component.page(params[:page]).per(10)
    @categories = CompCategory.all
  end

  def show
    @component = Component.find(params[:id])
    @categories = CompCategory.all
  end
end
