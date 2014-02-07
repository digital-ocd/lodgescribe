# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription_plan do
    name 'Monthly'
    stripe_id 'monthly'
    amount 40
    renewal_period 1
    trial_period 30
  end

  factory :subscription_plan_annual, class: "subscription_plan" do
    name 'Annual'
    stripe_id 'annual'
    amount 300
    renewal_period 12
    trial_period 30
  end

end
