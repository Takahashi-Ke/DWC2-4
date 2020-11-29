class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :notify_new_record, if: :devise_controller?, only: [:create]

  def notify_new_record
    NotificationMailer.complete_mail(@user).deliver
  end

  private

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :postal_code, :prefecture_code, :city, :building])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
