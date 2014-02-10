class ApplicationController < ActionController::Base
  class Unauthorized < StandardError; end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  delegate :allow?, to: :current_permission
  helper_method :allow?

  delegate :allow_param?, to: :current_permission
  helper_method :allow_param?

  def current_lodge
    @current_lodge ||= set_lodge
  end
  helper_method :current_lodge

  def current_permission
    @current_permission ||= Permissions.permission_for(app_user)
  end
  helper_method :current_permission

  private

  def after_sign_in_path_for(resource)
    if current_admin
      admin_root_path
    elsif current_user
      user_root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def app_user
    @app_user ||= ( current_user ) ? current_user : ( (current_admin) ? current_admin : nil )
  end

  def authorize
    if current_permission.allow?(params[:controller], params[:action], current_resource)
      current_permission.permit_params! params
    else
      raise ApplicationController::Unauthorized
    end
  end

  def current_resource
    nil
  end

  def set_lodge
    if params[:sub_domain]
      Lodge.find_by_sub_domain(params[:sub_domain])
    else
      current_user.lodges.first
    end
  end

end
