require 'rails_helper'

RSpec.describe User, :vcr do
  let(:user) { UserFacade.user_info(1) }
  it 'exists' do
    expect(user.id).to eq(user.id)
    expect(user.user_name).to eq("Borton Preekers")
    expect(user.email).to eq("borton@gmail.com")
    expect(user.street_address).to eq("123 Lane")
    expect(user.city).to eq("Denver")
    expect(user.state).to eq("CO")
    expect(user.zipcode).to eq("80211")
    expect(user.activity_preferences).to eq("Biking")
    expect(user.latitude).to eq(39.71854302040816)
    expect(user.longitude).to eq(-104.95596330612246)

    expect(user).to be_an_instance_of(User)
  end
end
