require "spec_helper"

describe Accounts::UsersController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lodge109/members").to route_to("accounts/members#index", sub_domain: "lodge109")
    end

    it "routes to #new" do
      expect(:get => "/lodge109/members/new").to route_to("accounts/members#new", sub_domain: "lodge109")
    end

    it "routes to #show" do
      expect(:get => "/lodge109/members/1").to route_to("accounts/members#show", sub_domain: "lodge109", id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/lodge109/members/1/edit").to route_to("accounts/members#edit", sub_domain: "lodge109", id: "1")
    end

    it "routes to #create" do
      expect(:post => "/lodge109/members").to route_to("accounts/members#create", sub_domain: "lodge109")
    end

    it "routes to #update" do
      expect(:put => "/lodge109/members/1").to route_to("accounts/members#update", sub_domain: "lodge109", id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lodge109/members/1").to route_to("accounts/members#destroy", sub_domain: "lodge109", id: "1")
    end

  end
end
