class AddSoftDeleteForMessages < ActiveRecord::Migration
  def up
  	change_table :messages do |t|
      t.datetime :deleted_at
    end
  end
end
