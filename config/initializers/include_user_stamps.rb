ActiveRecord::Base.class_eval do  
  self.stampable :creator_attribute => :created_by, :updater_attribute => :last_mod_by, :deleter => false
end