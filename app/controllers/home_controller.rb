class HomeController < ApplicationController

  layout "application"

  def index
    @chapters = Chapter.all || []
  	@markers = get_markers.to_json
  end

  protected

  def get_markers
  	markers = []    
  	@chapters.each do |chapter|
      if(!chapter.city.try(:name).blank?)
  		  options = Gmaps4rails.geocode(chapter.city.try(:name))
  		  markers << {:lat => options.first[:lat], :lng => options.first[:lng], :title => options.first[:matched_address], :link => chapter_path(chapter)}
     end
  	end
  	markers
  end
end
