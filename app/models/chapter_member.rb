class ChapterMember < ActiveRecord::Base
  acts_as_soft_deletable         
  stampable
  belongs_to :user
  belongs_to :chapter
  # Setup accessible (or protected) attributes for your model
  attr_accessible :chapter_id, :user_id, :memeber_type
  PRIMARY_COORDINATOR = "primary coordinator"
  SECONDARY_COORDINATOR = "secondary coordinator"
  MEMBER = 'member'

 end
