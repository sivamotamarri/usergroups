class Event < ActiveRecord::Base
  stampable
  acts_as_soft_deletable 
  belongs_to :user
  attr_accessible :title, :event_start_date, :event_end_date, :status, :description, :venue, :entry_fee, :chapter_id  
  
end
