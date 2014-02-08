class AccountsController < ApplicationController
  # rescue_from ActionController::NotAuthorized, with: :handle_access_denied
  prepend_before_action :current_lodge
  prepend_before_action :authenticate_user!
  # around_filter :user_time_zone, if: :current_user
  layout "admin"

  protected

  # def handle_access_denied exception
  #   respond_to do |format|
  #     flash[:error] = "Opps. You're not authorized to view that page."
  #     format.html { redirect_to client_locations_path(default_subscription_client) }
  #   end
  # end

  # def user_time_zone(&block)
  #   Time.use_zone(current_user.time_zone, &block)
  # end
end