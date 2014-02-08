require "spec_helper"

describe Permissions::MemberPermission do
  include_context 'lodge_with_member'

  subject { Permissions.permission_for(member) }

  it "authorization for users" do
    should authorize("accounts/users", :dashboard)
    should authorize("accounts/users", :index)
    should authorize("accounts/users", :show)
    should authorize("accounts/users", :new)
    should authorize("accounts/users", :create)
    should authorize("accounts/users", :edit)
    should authorize("accounts/users", :update)
    should authorize("accounts/users", :destroy)
  end

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
