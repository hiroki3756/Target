class ApplicationController < ActionController::Base
    # 新規登録で名前を登録できるようにする処理 
    protect_from_forgery with: :exception

    
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
