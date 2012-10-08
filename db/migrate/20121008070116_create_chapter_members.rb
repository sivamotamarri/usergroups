class CreateChapterMembers < ActiveRecord::Migration
  def change
    create_table :chapter_members do |t|
      t.integer :chapter_id ,:null => false
      t.integer :user_id ,:null => false      
      t.string  :memeber_type      	
      t.integer :created_by
      t.integer :updated_by
      t.datetime :deleted_at		
      t.timestamps
    end
  end
end
