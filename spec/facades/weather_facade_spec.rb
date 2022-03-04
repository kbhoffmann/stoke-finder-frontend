require 'rails_helper'

RSpec.describe WeatherFacade do

  it 'calls the weather poro for current weather of area' do
    VCR.use_cassette('weather_api') do
      latitude = 39.71854302040816
      longitude = -104.95596330612246

      expect(WeatherFacade.current_weather(latitude, longitude)).to be_a(Forecast)
    end
  end
end
