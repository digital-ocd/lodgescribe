# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admins_user, :class => 'Admins::User' do
    dashboard "MyString"
  end
end
