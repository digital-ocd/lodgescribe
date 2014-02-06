class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  delegate :allow?, to: :current_permission
  helper_method :allow?

  delegate :allow_param?, to: :current_permission
  helper_method :allow_param?

  private

  def after_sign_in_path_for(resource)
    if current_admin
      admin_root_path
    elsif current_user
      user_root_path
    end
  end

  def app_user
    @app_user ||= ( current_admin ) ? current_admin : nil
  end

  def authorize
    if current_permission.allow?(params[:controller], params[:action], current_resource)
      current_permission.permit_params! params
    else
      # FIXME
      #   - create and redirect to a "Not Authorized" error page
      redirect_to root_url, alert: "You are not authorized."
    end
  end

  def current_permission
    @current_permission ||= Permissions.permission_for(app_user)
  end

  def current_resource
    nil
  end

end
