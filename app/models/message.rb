class Message < ActiveRecord::Base
  belongs_to :chapter
  validates :body, presence: true
  acts_as_nested_set
  attr_accessible :sender_id, :body,:received_id,:chapter_id ,:parent_id , :lft ,:rgt, :depth
end
