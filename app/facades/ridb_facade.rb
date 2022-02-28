class RidbFacade
  def self.all_activities
    json = RidbService.get_activities
    
    json[:RECDATA].map do |activity|
      Activity.new(activity)
    end
  end
end
