class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_month, :birth_day, :age, :skin_type])
  end
end
