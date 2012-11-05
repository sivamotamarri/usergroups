class AddSoftDeleteForAnnouncements < ActiveRecord::Migration
  def up
  	change_table :announcements do |t|
      t.datetime :deleted_at
    end
  end
end
