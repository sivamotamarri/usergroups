class HomeController < ApplicationController

  layout "application"

  def index
    @cities = Chapter.all.collect{|chapter| chapter.city.try(:name)}.compact
  	@markers = get_markers.to_json
  end

  protected

  def get_markers
  	markers = []
  	@cities.each do |city|
  		options = Gmaps4rails.geocode(city)
  		markers << {:lat => options.first[:lat], :lng => options.first[:lng], :title => options.first[:matched_address]}
  	end
  	markers
  end
end
