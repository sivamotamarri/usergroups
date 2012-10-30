class Announcement < ActiveRecord::Base
   attr_accessible :title, :body , :photo

   has_attached_file :photo,
    :styles => { :medium => "157x161>", :thumb => "100x100>" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

end
