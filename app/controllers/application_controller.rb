class ApplicationController < ActionController::Base
  # NOTE: deviseとdevise以外でflashの表示方法が違うようなので
  #       deviseがnoticeを使い、devise以外はsuccessを使うようにする
  add_flash_types :success

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
