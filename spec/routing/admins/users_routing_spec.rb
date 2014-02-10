require "spec_helper"

describe Admins::UsersController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/a/users").to route_to("admins/users#index")
    end

    it "routes to #new" do
      expect(:get => "/a/users/new").to route_to("admins/users#new")
    end

    it "routes to #show" do
      expect(:get => "/a/users/1").to route_to("admins/users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/a/users/1/edit").to route_to("admins/users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/a/users").to route_to("admins/users#create")
    end

    it "routes to #update" do
      expect(:put => "/a/users/1").to route_to("admins/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/a/users/1").to route_to("admins/users#destroy", :id => "1")
    end

  end
end
