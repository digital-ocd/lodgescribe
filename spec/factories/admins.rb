# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    first_name 'Peter'
    last_name 'Parker'
    email Faker::Internet.email
    password 'foobar'
    password_confirmation 'foobar'
  end
end