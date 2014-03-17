module Permissions
  class MemberPermission < BasePermission
    def initialize(user)
      allow "accounts/lodges", [:edit, :show, :update]
        allow_param :lodge, [:name, :sub_domain]
      allow "accounts/members", [:create, :dashboard, :destroy, :edit, :index, :new, :show, :update]
        allow_param :user, [:current_password, :email, :first_name, :last_name, :password, :password_confirmation, :username]
      allow "accounts/users", [:create, :dashboard, :destroy, :edit, :index, :new, :show, :update]
        allow_param :user, [:current_password, :password, :password_confirmation, :username]
      allow "accounts/profiles", [:edit, :show, :update]
        allow_param :user, [:birth_city, :birth_date, :birth_state, :birth_country, :email, :first_name, :last_name ]
      allow "devise/passwords", [:new, :create, :edit, :update]
      allow "devise/sessions", [:new, :create, :destroy]
      allow :content, [:index, :pricing, :privacy, :terms]
      # allow :subscriptions, [:new, :create, :thankyou]
      # allow_param :subscription, [:amount, :billing_card_token, :next_renewal_at, :renewal_period, :status, :subscription_plan_id]
      # allow_nested_param :subscription, :user_attributes, [:email, :first_name, :last_name, :password, :password_confirmation, :username]
      # allow_nested_param :subscription, :clients_attributes, [:name]
    end
  end
end
