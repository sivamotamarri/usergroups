class Additionalcolumsntoevents < ActiveRecord::Migration
  def up
   change_table :events do |t|
      t.string :location
      t.string :address_line1
      t.string :address_line2      
      t.string :event_start_time      
      t.string :event_end_time
      t.string :city_name
      t.string :postal_code
      t.string :state_name
      t.string :country_name
      
  end
  end
 
end
