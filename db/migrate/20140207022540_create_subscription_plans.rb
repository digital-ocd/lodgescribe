class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.string   "name"
      t.string   "stripe_id"
      t.decimal  "amount",          :precision => 10, :scale => 2
      t.integer  "renewal_period",  :default => 1
      t.integer  "trial_period",    :default => 30
      t.text     "description"
      t.boolean  "is_featured",     :default => false

      t.timestamps
    end
    add_index :subscription_plans, :name
    add_index :subscription_plans, :stripe_id, :unique => true
  end
end
