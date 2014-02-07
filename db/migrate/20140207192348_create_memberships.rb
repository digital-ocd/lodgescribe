class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :lodge
      t.references :user
      t.string :role, limit: 20, default: "member"

      t.timestamps
    end
    add_index :memberships, [ :lodge_id, :user_id ], :unique => true
    add_index :memberships, :lodge_id
    add_index :memberships, :user_id
  end
end
