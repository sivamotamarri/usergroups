class CreateEventMembers < ActiveRecord::Migration
  def change
    create_table :event_members do |t|
      t.integer :event_id ,:null => false
      t.integer :user_id ,:null => false            
      t.integer :created_by
      t.integer :updated_by
      t.datetime :deleted_at		
      t.timestamps
    end
  end
end
