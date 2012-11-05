class Comment < ActiveRecord::Base
   acts_as_soft_deletable         
   stampable
   belongs_to :commentable, :polymorphic => true   
   belongs_to :user, :foreign_key => :created_by
   attr_accessible :commentable_type, :commentable_id, :content
end
