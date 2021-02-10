class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    diaries_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :birthyear, :birthdate, :height, :weight, :target_weight, :diet_style1, :diet_style2, :diet_style3, :diet_style4])
  end
end
