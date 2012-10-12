class Event < ActiveRecord::Base
  stampable
  attr_accessible :title, :event_start_date, :event_end_date, :status, :description, :venue, :entry_fee, :chapter_id  
  
end
