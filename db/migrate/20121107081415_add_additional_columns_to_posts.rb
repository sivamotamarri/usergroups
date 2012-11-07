class AddAdditionalColumnsToPosts < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
      t.integer :event_id
      t.string  :event_title
    end
  end
end
