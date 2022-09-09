class ApplicationController < ActionController::Base
    before_action :add_signup_params, if: :devise_controller?

    private
    def add_signup_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :birthday])
        devise_parameter_sanitizer.permit(:account_update , keys: [:username, :birthday, :avatar])
    end
end
