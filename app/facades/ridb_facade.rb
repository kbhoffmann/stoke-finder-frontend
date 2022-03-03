class RidbFacade

  def self.all_activities
    json = RidbService.get_activities
    json[:RECDATA].map do |activity|
      Activity.new(activity)
    end
  end

  def self.search_by_location(location_search, miles)
    geocoded = Geocoder.search(location_search)
    json = RidbService.get_rec_area(geocoded.first.data["lat"], geocoded.first.data["lon"], miles, activities = nil)
    json[:RECDATA].map do |data|
      RecArea.new(data)
    end
  end

  def self.search_by_activities(activities)
    json = RidbService.get_rec_area_by_activities(activities)
    json[:RECDATA].map do |data|
      RecArea.new(data)
    end
  end

  def self.get_rec_area_info_by_id(rec_area_id)
    area_json = RidbService.get_rec_area_by_id(rec_area_id)
    RecArea.new(area_json)
  end

  def self.get_activities_for_rec_area_by_id(rec_area_id)
    activities= RidbService.get_activities_for_rec_area_by_id(rec_area_id)
    activities.map do |activity_data|
      Activity.new(activity_data)
    end
  end
end
