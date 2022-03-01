require 'rails_helper'
RSpec.describe RidbService do
  it "gets all activities", :vcr do
    response = RidbService.get_activities
    response[:RECDATA].each do |data|
      expect(data).to be_a(Hash)
      expect(data).to have_key(:ActivityName)
    end
  end

  it 'can search for a rec area by multiple parameters', :vcr do
    data = {:id=>"1",
          :type=>"id",
          :attributes=>
          {:user_name=>"Borton Preekers",
            :email=>"borton@gmail.com",
            :street_address=>"123 Lane",
            :city=>"Denver",
            :state=>"CO",
            :zipcode=>"80211",
            :activity_preferences=>"Biking",
            :latitude=>39.71854302040816,
            :longitude=>-104.95596330612246}}
    user = User.new(data)
    latitude = user.latitude
    longitude = user.longitude
    radius = 10
    activities = [user.activity_preferences]

    expect(RidbService.get_rec_area(latitude,longitude,radius,activities)).to be_a(Hash)
    expect(RidbService.get_rec_area(latitude,longitude,radius,activities)[:RECDATA]).to be_an(Array)
    expect(RidbService.get_rec_area(latitude,longitude,radius,activities)[:RECDATA][0]).to be_a(Hash)

    rec_data = RidbService.get_rec_area(latitude,longitude,radius,activities)[:RECDATA][0]

    expect(rec_data).to have_key(:RecAreaID)
    expect(rec_data[:RecAreaID]).to be_a(String)
    expect(rec_data).to have_key(:RecAreaName)
    expect(rec_data[:RecAreaName]).to be_a(String)
    expect(rec_data).to have_key(:RecAreaDescription)
    expect(rec_data[:RecAreaDescription]).to be_a(String)
    expect(rec_data).to have_key(:RECAREAADDRESS)
    expect(rec_data[:RECAREAADDRESS][0]).to be_a(Hash)
    expect(rec_data).to have_key(:RecAreaDirections)
    expect(rec_data[:RecAreaDirections]).to be_a(String)
    expect(rec_data).to have_key(:RecAreaPhone)
    expect(rec_data[:RecAreaPhone]).to be_a(String)
    expect(rec_data).to have_key(:Reservable)
     #expect(rec_data[:Reservable]).to be_a(String)
    expect(rec_data).to have_key(:ACTIVITY)
    expect(rec_data[:ACTIVITY][0]).to be_a(Hash)
    expect(rec_data).to have_key(:RecAreaLongitude)
    expect(rec_data[:RecAreaLongitude]).to be_a(Float)
    expect(rec_data).to have_key(:RecAreaLatitude)
    expect(rec_data[:RecAreaLatitude]).to be_a(Float)
    expect(rec_data).to have_key(:MEDIA)
    expect(rec_data[:MEDIA]).to be_an(Array)
    expect(rec_data).to have_key(:LINK)
    expect(rec_data[:LINK]).to be_a(Array)
  end
end
