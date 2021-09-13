class ApplicationController < ActionController::Base
  
  protected
  
  def user_params
     params.require(:user).permit(:nickname, :birth_year, :birth_month, :birth_day, :age, :skin_type)
  end
end
