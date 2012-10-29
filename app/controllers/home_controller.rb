class HomeController < ApplicationController

  layout "application"

  def index
    @chapters = Chapter.all || []
  	@markers = get_markers.to_json
  end

  def directory
    @chapters = Chapter.all
    @markers = get_markers.to_json
  end

  protected

  def get_markers
  	markers = []    
  	@chapters.each do |chapter|  
      address = get_address(chapter)    
      if(!address.blank?)
  		  options = Gmaps4rails.geocode(address)
  		  markers << {:lat => options.first[:lat], :lng => options.first[:lng], :title => options.first[:matched_address], :link => chapter_path(chapter)}
     end
  	end
  	markers
  end

  def get_address(chapter)    
    city = chapter.city_name.blank? ? "" : chapter.city_name + "," 
    state = chapter.state_name.blank? ? "" : chapter.state_name + ","     
    country = chapter.country_name.blank? ? "" : chapter.country_name
    city + state + country
  end 
end
