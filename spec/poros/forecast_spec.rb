require 'rails_helper'
require 'date'

RSpec.describe Forecast do
  it 'has attributes' do
    weather_data =
    {:dt=>1646261770,
     :sunrise=>1646227892,
     :sunset=>1646268761,
     :temp=>64.6,
     :feels_like=>61.74,
     :pressure=>1015,
     :humidity=>21,
     :dew_point=>24.76,
     :uvi=>0.76,
     :clouds=>80,
     :visibility=>10000,
     :wind_speed=>1.77,
     :wind_deg=>334,
     :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}]}

     forecast = Forecast.new(weather_data)

     expect(forecast).to be_a(Forecast)
     expect(forecast.temp).to eq(64.6)
     expect(forecast.overview).to eq("Clouds")
     expect(forecast.description).to eq("broken clouds")
     expect(forecast.icon_number).to eq("04d")
     expect(forecast.feels_like_temp).to eq(61.74)
     expect(forecast.humidity).to eq(21)
     expect(forecast.wind_speed_mph).to eq(1.77)
     expect(forecast.uv_index).to eq(0.76)

     # expect(forecast.alerts)
     #  expect(forecast.sunrise).to eq()
     #  # Unix, UTC
     #  expect(forecast.sunset).to eq()
     # # Unix, UTC
  end
end
