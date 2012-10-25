class AddRejectApprovedDatesChapters < ActiveRecord::Migration
  def up
    change_table :chapters do |t|
      t.datetime :approved_on
      t.datetime :rejected_on
    end
  end
end
