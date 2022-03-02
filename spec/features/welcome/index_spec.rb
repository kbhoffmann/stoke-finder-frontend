require 'rails_helper'

RSpec.describe 'Welcome Index Page' do
  describe 'view' do

    it 'has links to home, login, register and search', :vcr do
      visit root_path
      click_link "Home"
      expect(current_path).to eq("/")

      visit root_path
      click_link "Register"
      expect(current_path).to eq("/register")

      # visit root_path
      # click_link "Search for Adventures"
      # expect(current_path).to eq("/adventures/search")
    end

    it 'has a title' do

      visit root_path

      expect(page).to have_content("Welcome to Stoke Finder!")
    end
  end
end
