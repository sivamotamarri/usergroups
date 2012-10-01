ActiveRecord::Base.class_eval do  
  self.stampable :creator_attribute => :created_by, :updater_attribute => :updated_by, :deleter => false
end