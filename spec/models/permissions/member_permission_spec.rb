require "spec_helper"

describe Permissions::MemberPermission do
  include_context 'lodge_with_member'

  subject { Permissions.permission_for(member) }

  it "authorization for lodges" do
    should authorize("accounts/lodges", :show)
    should authorize("accounts/lodges", :edit)
    should authorize("accounts/lodges", :update)
  end

  it "authorization for Lodge members" do
    should authorize("accounts/members", :index)
    should authorize("accounts/members", :show)
    should authorize("accounts/members", :new)
    should authorize("accounts/members", :create)
    should authorize("accounts/members", :edit)
    should authorize("accounts/members", :update)
    should authorize("accounts/members", :destroy)
  end

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

  it "authorization for user profile" do
    should authorize("accounts/profiles", :show)
    should authorize("accounts/profiles", :edit)
    should authorize("accounts/profiles", :update)
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
