class AdminsController < ApplicationController
  prepend_before_action :authenticate_admin!
  layout "admin"
end
