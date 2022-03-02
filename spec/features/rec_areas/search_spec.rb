require 'rails_helper'

RSpec.describe 'Search Page' do
  describe 'view' do
    it 'has links to home, login, register and search', :vcr do
      visit "rec_areas/search"
      click_link "Home"
      expect(current_path).to eq("/")

      visit "rec_areas/search"
      click_link "Register"
      expect(current_path).to eq("/register")
    end

    it 'has a title and multiple ways to search for activities', :vcr do
      visit "rec_areas/search"
      expect(page).to have_content("StokeFinder: Lets Find Your Stoke")
      expect(page).to have_content("Search all activites by Location(City, State):")
      expect(page).to have_content("Search by Activities")
      save_and_open_page
    end

    it "finds stoke when a location is entered" do
      VCR.turn_off!
      WebMock.enable_net_connect!
      visit "rec_areas/search"
      fill_in "Search all activites by Location(City, State)", with: "Denver, CO"
      within '#200' do
        check
      end
      click_button "Search by Location"
      expect(current_path).to eq("/rec_areas/search_by_location")
      expect(page).to have_content("Chatfield Lake")
      expect(page).to have_content("Plan an adventure for Chatfield Lake")
      save_and_open_page
    end
  end
end
