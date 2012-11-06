class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   :title
      t.string   :status
      t.string   :description
      t.integer  :chapter_id
      t.integer :created_by
      t.integer :updated_by
      t.datetime :deleted_at		
      t.timestamps
    end
  end
end
