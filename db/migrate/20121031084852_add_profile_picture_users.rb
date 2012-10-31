class AddProfilePictureUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :profile_picture
    end
  end
end
