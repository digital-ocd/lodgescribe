class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.date :initiated_at
      t.date :passed_at
      t.date :raised_at
      t.date :birth_date
      t.string :birth_city
      t.string :birth_state
      t.string :birth_country

      t.timestamps
    end
    add_index :profiles, :initiated_at
    add_index :profiles, :passed_at
    add_index :profiles, :raised_at
    add_index :profiles, :birth_date
  end
end
