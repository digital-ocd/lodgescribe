# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lodge do
    sequence(:name) {|n| "Masonic Lodge #{n}" }
    sequence(:sub_domain) {|n| "lodge-#{n}" }
  end
end
