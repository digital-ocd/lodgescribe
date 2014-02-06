require "spec_helper"

describe Permissions::SaasAdminPermission do
  subject { Permissions.permission_for(build_stubbed(:admin)) }

  it "allows anything" do
    should authorize(:any, :thing)
    should allow_param(:any, :thing)
  end
end