class AddUserAnnouncements < ActiveRecord::Migration
  def up
    change_table :announcements do |t|
      t.integer :user_id
    end
  end
end
