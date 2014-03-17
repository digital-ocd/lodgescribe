# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    initiated_at "2014-03-05"
    passed_at "2014-03-05"
    raised_at "2014-03-05"
    birth_date "2014-03-05"
    birth_city "Smalltown"
    birth_state "OH"
    birth_country "USA"
  end
end
