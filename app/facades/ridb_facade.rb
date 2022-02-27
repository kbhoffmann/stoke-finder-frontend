class RidbFacade
  def self.all_activities
    RidbService.get_activities[:RECDATA].map do |data|
      Activity.new(data)
    end
  end
end