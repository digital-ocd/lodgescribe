# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'George'
    last_name 'Washington'
    sequence(:username) {|n| "mason-#{n}" }
    sequence(:email) {|n| "mason-#{n}@example.com" }
    password 'foobar'
    password_confirmation 'foobar'
  end
end
