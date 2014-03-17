require "spec_helper"

describe Accounts::ProfilesController do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/u/profile").to route_to("accounts/profiles#show")
    end

    it "routes to #edit" do
      expect(:get => "/u/profile/edit").to route_to("accounts/profiles#edit")
    end

    it "routes to #update" do
      expect(:put => "/u/profile").to route_to("accounts/profiles#update")
    end

  end
end
