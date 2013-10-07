class AddOwnerIdToLots < ActiveRecord::Migration
  def change
    add_column :lots, :owner_id, :integer
  end
end
