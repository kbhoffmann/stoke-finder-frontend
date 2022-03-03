require 'rails_helper'

RSpec.describe 'Search Page', :vcr do
  describe 'view' do
    it 'has links to home, login, register and search', :vcr do
      visit "/rec_areas/search"
      click_link "Home"
      expect(current_path).to eq("/")

      visit "/rec_areas/search"
      click_link "Register"
      expect(current_path).to eq("/register")
    end

    it 'has a title and multiple ways to search for activities', :vcr do
      visit "/rec_areas/search"
      expect(page).to have_content("StokeFinder: Lets Find Your Stoke")
      expect(page).to have_content("Search all activites by Location(City, State):")
      expect(page).to have_content("Search by Activities")
    end

    it "finds stoke when a location is entered", :vcr do
      visit "/rec_areas/search"
      fill_in "Search all activites by Location(City, State)", with: "Denver, CO"
      within '#200' do
        check
      end
      click_button "Search by Location"
      expect(current_path).to eq("/rec_areas/search_by_location")
      expect(page).to have_content("Chatfield Lake")
      expect(page).to have_content("Plan an adventure for Chatfield Lake")
    end

    it "finds stoke preferences are entered based on user's saved addy", :vcr do
      visit "/register"
       fill_in :user_name, with: "#{Faker::Artist.name}"
       fill_in :email, with: "#{Faker::GreekPhilosophers.name}@#{Faker::Artist.name}.com"
       fill_in :password, with: 'password12345'
       fill_in :password_confirmation, with: 'password12345'
       fill_in :street_address, with: '1234 Main St'
       fill_in :city, with: 'Denver'
       fill_in :state, with: 'CO'
       fill_in :zipcode, with: '80220'

       within '#activity-100049' do #ACCESSIBLE SWIMMING
         check
       end

       within '#activity-100050' do #SOFTBALL
         check
       end

      click_button 'Submit'

      # no login yet so requiring register to set session for things that require session.

      click_button "Start An Adventure"

      within '#activity-16' do
        check
      end
      within '#activity-15' do
        check
      end
      click_button "Search by Activity"

      expect(current_path).to eq("/rec_areas/search_by_activities")
      expect(page).to have_link("Plan an adventure for Apostle Islands National Lakeshore")
    end

    it "links to the rec area show page", :vcr do
      visit "/rec_areas/search"

      id = "284"

      fill_in "Search all activites by Location(City, State)", with: "Denver, CO"
      within '#200' do
        check
      end
      click_button "Search by Location"

      expect(current_path).to eq("/rec_areas/search_by_location")
      expect(page).to have_content("Chatfield Lake")
      click_link("Chatfield Lake Details")
      expect(current_path).to eq("/rec_areas/#{id}")
    end
  end

  it "functioning link for create an adventure" do
    VCR.eject_cassette

    VCR.turn_off!

    WebMock.enable_net_connect!
    visit "/register"
     fill_in :user_name, with: "#{rand.to_s}"
     fill_in :email, with: "#{rand.to_s}@#{Faker::Artist.name}.com"
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
    fill_in :guest_email_addresses, with: "bob@gmail.com"
    fill_in :comments, with: "woop"
    click_button "🤙 Create adventure! 🤙"
  end
end
