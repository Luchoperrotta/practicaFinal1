class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username])
    end

    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |formad|
            format.html {redirect_to main_app.root_url, notice: exeption.message}
        end
    end

end
