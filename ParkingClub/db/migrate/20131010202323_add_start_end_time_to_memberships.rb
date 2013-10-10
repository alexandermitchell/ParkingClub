class AddStartEndTimeToMemberships < ActiveRecord::Migration
  def change
    change_table :memberships do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.remove :days, :weeks, :months, :years, :price_in_cents

    end
  end
end