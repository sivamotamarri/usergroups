class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :commentable_id      
      t.string :commentable_type
      t.integer :created_by
      t.integer :updated_by
      t.datetime :deleted_at		
      t.timestamps
    end
  end
end
