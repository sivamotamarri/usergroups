class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users , :mobile , :string
    add_column :users , :website_url , :string
    add_column :users , :linkedin_url, :string
    add_column :users , :twitter_url, :string
    add_column :users , :location, :string
  end
end
