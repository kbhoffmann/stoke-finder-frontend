class RidbFacade

  def self.all_activities
    json = RidbService.get_activities
    json[:RECDATA].map do |activity|
      Activity.new(activity)
    end
  end

  def self.search_by_location(location_search, miles)
    geocoded = Geocoder.search(location_search)
    json = RidbService.get_rec_area_location(geocoded.first.data["lat"], geocoded.first.data["lon"], miles)
    json[:RECDATA].map do |data|
      RecArea.new(data)
    end
  end
end
