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


  def self.get_chapters(user_id)
    ChapterMember.find_all_by_user_id(user_id) 
  end
  
  def self.get_details_if_coordinator(user_id)
    ChapterMember.find(:all , :conditions => [" user_id = ? and memeber_type in (?)", user_id, [PRIMARY_COORDINATOR, SECONDARY_COORDINATOR]])
  end

  def self.am_i_coordiantor?(user_id, chapter_id)
    ChapterMember.find(:all , :conditions => [" user_id = ? and chapter_id = ? and memeber_type in (?)", user_id, chapter_id, [PRIMARY_COORDINATOR, SECONDARY_COORDINATOR]]).present?
  end

  def self.is_primary_coordinator?(user_id)
  	ChapterMember.find(:all , :conditions => [" user_id = ? and memeber_type = ?", user_id, PRIMARY_COORDINATOR]).present?
  end

  def self.is_secondary_coordinator?(user_id)
  	ChapterMember.find(:all , :conditions => [" user_id = ? and memeber_type = ?", user_id, SECONDARY_COORDINATOR]).present?
  end
  
  def self.is_just_member?(user_id)
  	ChapterMember.find(:all , :conditions => [" user_id = ? and memeber_type = ?", user_id, MEMBER]).present?
  end

end
