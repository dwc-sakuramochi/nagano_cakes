class ApplicationController < ActionController::Base

   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :tel])
  end

  def authenticate_admin
    if current_admin==nil
      flash[:notice]="ログインが必要です"
      redirect_to root_path
    end
  end
  def autheniticate_customer
    if current_customer==nil
      flash[:notice]="ログインが必要です"
      redirect_to root_path
    end
  end
end
