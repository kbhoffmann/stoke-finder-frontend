require 'rails_helper'

RSpec.describe WeatherService do

  it 'gets weather data for an area by geocodes', :vcr do
    latitude = 39.71854302040816
    longitude = 39.71854302040816

    expect(WeatherService.get_weather(latitude, longitude)).to be_a(Hash)
    weather_data = WeatherService.get_weather(latitude, longitude)
    expect(weather_data).to have_key(:current)
    expect(weather_data[:current]).to be_a(Hash)
    expect(weather_data[:current]).to have_key(:temp)
    expect(weather_data[:current]).to have_key(:humidity)
    expect(weather_data[:current]).to have_key(:clouds)
    expect(weather_data[:current]).to have_key(:visibility)
    expect(weather_data[:current]).to have_key(:wind_speed)
    expect(weather_data[:current]).to have_key(:feels_like)
    expect(weather_data[:current]).to have_key(:sunrise)
    expect(weather_data[:current]).to have_key(:sunset)
    expect(weather_data[:current]).to have_key(:weather)
    expect(weather_data[:current][:weather]).to be_an(Array)
    expect(weather_data[:current][:weather].first).to be_a(Hash)
    expect(weather_data[:current][:weather].first[:main]).to be_a(String)
    expect(weather_data[:current][:weather].first[:description]).to be_a(String)
    expect(weather_data[:current][:weather].first[:icon]).to be_a(String)
    expect(weather_data[:current][:weather].first).to be_a(Hash)
    expect(weather_data).to have_key(:hourly)
    expect(weather_data[:hourly]).to be_an(Array)
    expect(weather_data).to have_key(:daily)
    expect(weather_data[:daily]).to be_an(Array)
  end

end
