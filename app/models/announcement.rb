class Announcement < ActiveRecord::Base
   attr_accessible :title, :body , :photo , :user_id 

   has_attached_file :photo,
    :styles => { :medium => "650x438>", :thumb => "128x90>" , :mini => "60x60>" },
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
   validates :title , :body , :presence => true
end
