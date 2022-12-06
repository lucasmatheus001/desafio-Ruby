class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation, :cpf, :birthday)
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    dashboard_index_path
  end

  private 

  def user_not_authorized
    flash[:alert] = "Você não está autorizado a executar esta ação."
    redirect_to(request.referrer || root_path)
  end
end
