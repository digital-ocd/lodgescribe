require "spec_helper"

describe Permissions::GuestPermission do
  subject { Permissions.permission_for(nil) }

  # it "authorization for signup" do
  #   should authorize(:subscriptions, :new)
  #   should authorize(:subscriptions, :create)
  # end

  it "authorization for sessions" do
    should authorize("devise/sessions", :new)
    should authorize("devise/sessions", :create)
    should authorize("devise/sessions", :destroy)
  end

  it "authorization for static content" do
    should authorize(:content, :index)
    should authorize(:content, :pricing)
    should authorize(:content, :privacy)
    should authorize(:content, :terms)
  end

end
