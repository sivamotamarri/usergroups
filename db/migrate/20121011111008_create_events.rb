class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :title
      t.string   :event_start_date      
      t.string   :event_end_date
      t.string   :status
      t.string   :description
      t.string   :entry_fee
      t.string   :venue      
      t.integer  :chapter_id
      t.integer :created_by
      t.integer :updated_by
      t.datetime :deleted_at	
      t.timestamps
    end
  end
end
