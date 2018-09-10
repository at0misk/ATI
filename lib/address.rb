require_relative 'geocoding'

class Address
  attr_accessor :lat, :lng, :full_address, :distance
  def initialize (lat, lng, full_address, distance)
  	@lat = lat
  	@lng = lng
  	@full_address = full_address
  	@distance = distance
  end
end
