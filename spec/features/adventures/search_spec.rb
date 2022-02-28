require 'rails_helper'

RSpec.describe 'Search Page' do
  describe 'view' do
    it 'has links to home, login, register and search' do
      visit "adventures/search"
      click_link "Home"
      expect(current_path).to eq("/")

      visit "adventures/search"
      click_link "Register"
      expect(current_path).to eq("/register")

      visit "adventures/search"
      click_link "Search for Adventures"
      expect(current_path).to eq("/adventures/search")
    end

    it 'has a title and multiple ways to search for activities' do
      visit "adventures/search"

      expect(page).to have_content("StokeFinder: Lets Find Your Stoke")
      expect(page).to have_content("Search by Location")
      expect(page).to have_content("Search by Activities")
    end
  end
end
