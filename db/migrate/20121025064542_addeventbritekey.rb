class Addeventbritekey < ActiveRecord::Migration
  def up
   change_table :events do |t|
      t.string :eventbrite_id
      
  end  
  end
end
