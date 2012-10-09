class HomeController < ApplicationController

  def index
  	@markers = get_markers.to_json
  end

  protected

  def get_markers
  	markers = []
  	%w(Hyderabad Chennai Banglore Mumbai Pune).each do |city|
  		options = Gmaps4rails.geocode(city)
  		markers << {:lat => options.first[:lat], :lng => options.first[:lng], :title => options.first[:matched_address]}
  	end
  	markers
  end
end
