require 'spec_helper'
include ActionView::Helpers::NumberHelper

describe SubscriptionPlan do

  it { should respond_to(:amount) }
  it { should respond_to(:description) }
  it { should respond_to(:is_featured) }
  it { should respond_to(:name) }
  it { should respond_to(:renewal_period) }
  it { should respond_to(:stripe_id) }
  it { should respond_to(:trial_period) }

  describe "to_param" do
    it "defaults to the stripe_id" do
      plan = build(:subscription_plan)
      expect(plan.to_param).to eq(plan.stripe_id)
    end
  end

  describe "Validations" do
    [:name, :renewal_period, :stripe_id, :trial_period].each do |attr|
      it "must have a #{attr}" do
        plan = build(:subscription_plan, attr => nil)
        plan.should_not be_valid
        plan.errors[attr].should_not be_nil
      end
    end

    describe "Renewal Period" do
      it "should be greater than zero" do
        plan = build(:subscription_plan, :renewal_period => 0)
        plan.should_not be_valid
        plan.errors[:renewal_period].should_not be_nil
      end
    end

    describe "Trial Period" do
      it "is allowed to be zero" do
        plan = build(:subscription_plan, :trial_period => 0)
        plan.should be_valid
      end
    end

    [:renewal_period, :trial_period].each do |attr|
      it "#{attr} should be an intenger" do
        plan = build(:subscription_plan, attr => 'b.bb')
        plan.should_not be_valid
        plan.errors[attr].should_not be_nil
      end
    end

  end
end
