class CreateMembershipsUsers < ActiveRecord::Migration
  def change
    create_table :memberships_users do |t|

      t.integer :membership_id
      t.integer :user_id

      t.timestamps
    end
  end
end
