module Permissions
  def self.permission_for(user)
    if user.nil?
      GuestPermission.new
    elsif user.saas_admin?
      SaasAdminPermission.new(user)
    end
  end
end
