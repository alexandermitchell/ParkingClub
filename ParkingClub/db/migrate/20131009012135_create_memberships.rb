class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :price_in_cents
      t.integer :days
      t.integer :weeks
      t.integer :months
      t.integer :years
      t.integer :lot_id

      t.timestamps
    end
  end
end
