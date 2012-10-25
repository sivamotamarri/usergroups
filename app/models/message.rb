class Message < ActiveRecord::Base
  belongs_to :chapter
  belongs_to :sender, :class_name => 'User' , :foreign_key => :sender_id
  belongs_to :receiver, :class_name => 'User', :foreign_key => :received_id
  validates :body, presence: true
  acts_as_nested_set
  attr_accessible :sender_id, :body,:received_id,:chapter_id ,:parent_id , :lft ,:rgt, :depth
end
