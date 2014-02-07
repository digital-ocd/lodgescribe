module Permissions
  class GuestPermission < BasePermission
    def initialize
      allow "devise/passwords", [:new, :create, :edit, :update]
      allow "devise/sessions", [:new, :create, :destroy]
      allow :content, [:index, :pricing, :privacy, :terms]
      allow :subscriptions, [:new, :create, :thankyou]
      # allow_param :subscription, [:amount, :billing_card_token, :next_renewal_at, :renewal_period, :status, :subscription_plan_id]
      # allow_nested_param :subscription, :user_attributes, [:email, :first_name, :last_name, :password, :password_confirmation, :username]
      # allow_nested_param :subscription, :clients_attributes, [:name]
    end
  end
end
