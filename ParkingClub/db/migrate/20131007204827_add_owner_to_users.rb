class AddOwnerToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :owner, :boolean, default: false
  end

  def self.down
    remove_column :users, :owner
  end
end
