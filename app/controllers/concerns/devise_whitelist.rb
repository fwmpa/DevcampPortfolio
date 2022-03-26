module DeviseWhitelist
  extend ActiveSupport::Concern
  included do
    #create and run a method anytime communicating with devise
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
