require "spec_helper"

describe Accounts::UsersController do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/u/profile").to route_to("accounts/users#show")
    end

    it "routes to #edit" do
      expect(:get => "/u/profile/edit").to route_to("accounts/users#edit")
    end

    it "routes to #update" do
      expect(:put => "/u/profile").to route_to("accounts/users#update")
    end

  end
end
