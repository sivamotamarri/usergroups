class CreateMailMessages < ActiveRecord::Migration
  def change
    create_table :mail_messages do |t|
      t.integer :sender_id
      t.integer :received_id
      t.string :subject
      t.text :body
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
