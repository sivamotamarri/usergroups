class Event < ActiveRecord::Base
  stampable
  acts_as_soft_deletable   
  has_many :event_members
  has_many :users , :through => :event_members
  belongs_to :chapter
  belongs_to :user , :foreign_key => :created_by
  attr_accessible :title, :event_start_date, :event_end_date, :status, :description, :venue, :entry_fee, :chapter_id , :location,  :address_line1,   :address_line2 ,:event_start_time ,:event_end_time, :city_name, :postal_code, :state_name, :country_name 
  
end
