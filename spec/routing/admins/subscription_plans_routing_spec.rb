require "spec_helper"

describe Admins::SubscriptionPlansController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/a/subscription_plans").to route_to("admins/subscription_plans#index")
    end

    it "routes to #new" do
      expect(:get => "/a/subscription_plans/new").to route_to("admins/subscription_plans#new")
    end

    it "routes to #show" do
      expect(:get => "/a/subscription_plans/1").to route_to("admins/subscription_plans#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/a/subscription_plans/1/edit").to route_to("admins/subscription_plans#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/a/subscription_plans").to route_to("admins/subscription_plans#create")
    end

    it "routes to #update" do
      expect(:put => "/a/subscription_plans/1").to route_to("admins/subscription_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/a/subscription_plans/1").to route_to("admins/subscription_plans#destroy", :id => "1")
    end

  end
end
