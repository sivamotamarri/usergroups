class AddCityStateCountryFieldsForChaptersTable < ActiveRecord::Migration
  def self.up
    change_table :chapters do |t|
      t.string :city_name
      t.string :state_name
      t.string :country_name
  end
 end

end
