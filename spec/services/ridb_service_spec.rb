require 'rails_helper'
RSpec.describe RidbService do
  it "gets all activities", :vcr do
    WebMock.enable_net_connect!
    response = RidbService.get_activities
    response[:RECDATA].each do |data|
      expect(data).to be_a(Hash)
      expect(data).to have_key(:ActivityName)
    end
  end
end