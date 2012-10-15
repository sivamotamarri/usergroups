class Chapter < ActiveRecord::Base
  acts_as_soft_deletable         
  stampable

  has_many :chapter_members
  has_many :users , :through => :chapter_members
  has_many :events
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :chapter_type, :country_id , :state_id, :city_id , :locality, :address ,:landmark
  
end
