class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resource)
        mypage_end_user_path
    end
    
    def after_sign_out_path_for(resource)
        root_path
    end


    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :kana_surname,:surname, :kana_name, :postal_code, :street_address, :phone_number])
        devise_parameter_sanitizer.permit(:sign_in, keys:[:email])
    end
   
end
