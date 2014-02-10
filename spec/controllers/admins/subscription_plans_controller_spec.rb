require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Admins::SubscriptionPlansController do

  let(:valid_attributes) { attributes_for(:subscription_plan) }
  let(:admin) { create(:admin) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in admin
  end

  describe "GET index" do
    it "assigns all subscription_plans as @subscription_plans" do
      subscription_plan = SubscriptionPlan.create! valid_attributes
      get :index, {}
      expect(assigns(:subscription_plans)).to eq([subscription_plan])
    end
  end

  describe "GET new" do
    it "assigns a new subscription_plan as @subscription_plan" do
      get :new, {}
      expect(assigns(:subscription_plan)).to be_a_new(SubscriptionPlan)
    end
  end

  describe "GET edit" do
    it "assigns the requested subscription_plan as @subscription_plan" do
      subscription_plan = SubscriptionPlan.create! valid_attributes
      get :edit, {id: subscription_plan.stripe_id}
      expect(assigns(:subscription_plan)).to eq(subscription_plan)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SubscriptionPlan" do
        expect {
          post :create, {:subscription_plan => valid_attributes}
        }.to change(SubscriptionPlan, :count).by(1)
      end

      it "assigns a newly created subscription_plan as @subscription_plan" do
        post :create, {:subscription_plan => valid_attributes}
        expect(assigns(:subscription_plan)).to be_a(SubscriptionPlan)
        expect(assigns(:subscription_plan)).to be_persisted
      end

      it "redirects to the created subscription_plan" do
        post :create, {:subscription_plan => valid_attributes}
        expect(response).to redirect_to(admin_subscription_plans_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved subscription_plan as @subscription_plan" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(SubscriptionPlan).to receive(:save).and_return(false)
        post :create, {:subscription_plan => {  }}
        expect(assigns(:subscription_plan)).to be_a_new(SubscriptionPlan)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(SubscriptionPlan).to receive(:save).and_return(false)
        post :create, {:subscription_plan => {  }}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested subscription_plan" do
        subscription_plan = SubscriptionPlan.create! valid_attributes
        # Assuming there are no other subscription_plans in the database, this
        # specifies that the SubscriptionPlan created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(SubscriptionPlan).to receive(:update).with({ "these" => "params" })
        put :update, {id: subscription_plan.stripe_id, :subscription_plan => { "these" => "params" }}
      end

      it "assigns the requested subscription_plan as @subscription_plan" do
        subscription_plan = SubscriptionPlan.create! valid_attributes
        put :update, {id: subscription_plan.stripe_id, :subscription_plan => valid_attributes}
        expect(assigns(:subscription_plan)).to eq(subscription_plan)
      end

      it "redirects to the subscription_plan" do
        subscription_plan = SubscriptionPlan.create! valid_attributes
        put :update, {id: subscription_plan.stripe_id, :subscription_plan => valid_attributes}
        expect(response).to redirect_to(admin_subscription_plans_path)
      end
    end

    describe "with invalid params" do
      it "assigns the subscription_plan as @subscription_plan" do
        subscription_plan = SubscriptionPlan.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(SubscriptionPlan).to receive(:save).and_return(false)
        put :update, {id: subscription_plan.stripe_id, :subscription_plan => {  }}
        expect(assigns(:subscription_plan)).to eq(subscription_plan)
      end

      it "re-renders the 'edit' template" do
        subscription_plan = SubscriptionPlan.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(SubscriptionPlan).to receive(:save).and_return(false)
        put :update, {id: subscription_plan.stripe_id, :subscription_plan => {  }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested subscription_plan" do
      subscription_plan = SubscriptionPlan.create! valid_attributes
      expect {
        delete :destroy, {id: subscription_plan.stripe_id}
      }.to change(SubscriptionPlan, :count).by(-1)
    end

    it "redirects to the subscription_plans list" do
      subscription_plan = SubscriptionPlan.create! valid_attributes
      delete :destroy, {id: subscription_plan.stripe_id}
      expect(response).to redirect_to(admin_subscription_plans_path)
    end
  end

end