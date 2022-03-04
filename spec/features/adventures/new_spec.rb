require 'rails_helper'

RSpec.describe 'Create New Adventure Page', :vcr do
  xit 'shows a form to create a new adventure' do

    visit "/register"
     fill_in :user_name, with: "#{rand.to_s}"
     fill_in :email, with: "#{rand.to_s}@mail.com"
     fill_in :password, with: 'password12345'
     fill_in :password_confirmation, with: 'password12345'
     fill_in :street_address, with: '1234 Main St'
     fill_in :city, with: 'Denver'
     fill_in :state, with: 'CO'
     fill_in :zipcode, with: '80220'


     within '#activity-100049' do #ACCESSIBLE SWIMMING
       check
     end

    click_button 'Submit'
    # no login yet so requiring register to set session for things that require session.
    click_button "Start An Adventure"

    fill_in "Search all activites by Location(City, State)", with: "Denver, CO"

    click_button "Search by Location"
    expect(current_path).to eq("/rec_areas/search_by_location")
    expect(page).to have_content("Chatfield Lake")
    click_link("Plan an adventure for Chatfield Lake")
    expect(current_path).to eq('/adventures/new')
    fill_in :guest_email_addresses, with: "bob@gmail.com"
    fill_in :comments, with: "woop"
    click_button "🤙   Create adventure!   🤙"
    expect(current_path).to eq('/adventures/create')
  end
end
