require "spec_helper"

describe Accounts::UsersController do
  describe "routing" do

    it "routes to #dashboard" do
      expect(:get => "/u/dashboard").to route_to("accounts/users#dashboard")
    end

    it "routes to #index" do
      expect(:get => "/lodge109/users").to route_to("accounts/users#index", sub_domain: "lodge109")
    end

    it "routes to #new" do
      expect(:get => "/lodge109/users/new").to route_to("accounts/users#new", sub_domain: "lodge109")
    end

    it "routes to #show" do
      expect(:get => "/lodge109/users/1").to route_to("accounts/users#show", sub_domain: "lodge109", id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/lodge109/users/1/edit").to route_to("accounts/users#edit", sub_domain: "lodge109", id: "1")
    end

    it "routes to #create" do
      expect(:post => "/lodge109/users").to route_to("accounts/users#create", sub_domain: "lodge109")
    end

    it "routes to #update" do
      expect(:put => "/lodge109/users/1").to route_to("accounts/users#update", sub_domain: "lodge109", id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lodge109/users/1").to route_to("accounts/users#destroy", sub_domain: "lodge109", id: "1")
    end

  end
end
