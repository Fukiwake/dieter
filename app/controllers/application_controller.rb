class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :birthdate, :height, :target_weight, :diet_style1, :diet_style2, :diet_style3, :diet_style4])
  end
end
