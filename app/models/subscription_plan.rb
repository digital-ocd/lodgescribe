class SubscriptionPlan < ActiveRecord::Base

  validates_presence_of :name, :stripe_id, :renewal_period, :trial_period
  validates_numericality_of :renewal_period, only_integer: true, greater_than: 0
  validates_numericality_of :trial_period, only_integer: true, greater_than_or_equal_to: 0

  def to_param
    stripe_id
  end

end
