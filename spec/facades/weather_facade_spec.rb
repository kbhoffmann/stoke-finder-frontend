require 'rails_helper'

RSpec.describe WeatherFacade do

  xit 'calls the weather poro for current weather of area', :vcr do
    latitude = 39.71854302040816
    longitude = -104.95596330612246

    expect(WeatherFacade.current_weather(latitude, longitude)).to be_a(Forecast)
  end

end
