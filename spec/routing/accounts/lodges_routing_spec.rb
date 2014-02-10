require "spec_helper"

describe Accounts::LodgesController do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/lodge109").to route_to("accounts/lodges#show", sub_domain: "lodge109")
    end

    it "routes to #edit" do
      expect(:get => "/lodge109/edit").to route_to("accounts/lodges#edit", sub_domain: "lodge109")
    end

    it "routes to #update" do
      expect(:put => "/lodge109").to route_to("accounts/lodges#update", sub_domain: "lodge109")
    end

  end
end
