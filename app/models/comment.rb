class Comment < ActiveRecord::Base
   stampable
   acts_as_soft_deletable         
   belongs_to :commentable, :polymorphic => true   
   belongs_to :user, :foreign_key => :created_by
   attr_accessible :commentable_type, :commentable_id, :content
end
