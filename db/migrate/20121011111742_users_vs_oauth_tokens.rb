class UsersVsOauthTokens < ActiveRecord::Migration
  def up
  	create_table :eventbrite_oauth_tokens do |t|
      t.integer :user_id
      t.string  :event_brite_token
      t.string   :user_email      
   	  t.integer :created_by
      t.integer :updated_by
      t.datetime :deleted_at	
      t.timestamps
    end
  end

end
