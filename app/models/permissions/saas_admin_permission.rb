module Permissions
  class SaasAdminPermission < BasePermission
    def initialize(user)
      allow_all
    end
  end
end