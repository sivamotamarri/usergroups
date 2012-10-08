class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string   :name
      t.string   :chapter_type      
      t.string   :chapter_status
      t.string   :country_id
      t.string   :state_id
      t.string   :city_id
      t.string   :locality
      t.string   :address
      t.string   :landmark	
      t.integer :created_by
      t.integer :updated_by
      t.datetime :deleted_at	
      t.timestamps
    end
  end
end
