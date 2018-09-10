require 'sinatra/base'
Dir['./lib/*.rb'].each { |f| require f }

class Main < Sinatra::Base
  get '/' do
  	white_house = Geocoder.search("1600 Pennsylvania Avenue NW Washington, D.C. 20500")
  	@results = []
  	coordinates = [
  		[61.582195, -149.443512],
  		[44.775211, -68.774184],
  		[25.891297, -97.393349],
  		[45.787839, -108.502110],
  		[35.109937, -89.959983]
  	]
  	coordinates.each do |val|
  		full_address = Geocoder.search([val[0], val[1]])
  		distance = Geocoder::Calculations.distance_between([val[0],val[1]], white_house.first.coordinates)
  		address = Address.new(val[0], val[1], full_address.first.address, distance.round(2))
  		@results << address
  	end
  	@results = @results.sort_by(&:distance)
    erb :index
  end

end
