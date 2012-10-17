class Event < ActiveRecord::Base
  stampable
  acts_as_soft_deletable   
  has_many :event_members
  has_many :users , :through => :event_members
  belongs_to :chapter
  attr_accessible :title, :event_start_date, :event_end_date, :status, :description, :venue, :entry_fee, :chapter_id  
  
end
