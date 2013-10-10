class AddPriceToLots < ActiveRecord::Migration
  def change
    change_table :lots do |t|

      t.integer :daily_rate_in_cents
    
    end  
  end
end
