class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :name
      t.string :country
      t.string :province
      t.string :city
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
