class EventMember < ActiveRecord::Base
acts_as_soft_deletable         
  stampable
  belongs_to :user
  belongs_to :event
  # Setup accessible (or protected) attributes for your model
  attr_accessible :event_id, :user_id
end
