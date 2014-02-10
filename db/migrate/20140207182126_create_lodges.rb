class CreateLodges < ActiveRecord::Migration
  def change
    create_table :lodges do |t|
      t.integer :subscription_id
      t.string :name
      t.string :sub_domain
      t.timestamps
    end
  end
end
