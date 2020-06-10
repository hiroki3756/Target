class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:top]
    # 新規登録で名前を登録できるようにする処理 
    protect_from_forgery with: :exception

    
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    # ログイン後とログアウト後の遷移先設定
    

  def after_sign_in_path_for(resource)
    user_user_path(resource.id)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
