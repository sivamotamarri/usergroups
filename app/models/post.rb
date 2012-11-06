class Post < ActiveRecord::Base
	acts_as_soft_deletable         
  	stampable	
	belongs_to :chapter
	belongs_to :user , :foreign_key => :created_by
	attr_accessor :title, :description, :created_at, :chapter_id
end
