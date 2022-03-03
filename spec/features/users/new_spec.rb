require 'rails_helper'

RSpec.describe 'New User Page' do
  describe 'view' do
    it 'has links to home, login, register and search', :vcr do
      visit "/register"
      click_link "Home"
      expect(current_path).to eq("/")

      visit "/register"
      click_link "Register"
      expect(current_path).to eq("/register")

      # visit "/register"
      # click_link "Search for Adventures"
      # expect(current_path).to eq("/adventures/search")
    end

    xit 'has a title and fields to fill out for new users', :vcr do
      #check with robin!!
      visit "/register"

      expect(page).to have_content("Create a New Account")
       fill_in :user_name, with: "#{Faker::Artist.name}"
       fill_in :email, with: "agop5134@gmail.com"
       fill_in :password, with: 'password12345'
       fill_in :password_confirmation, with: 'password12345'
       fill_in :street_address, with: '3557 Alcott St'
       fill_in :city, with: 'Denver'
       fill_in :state, with: 'CO'
       fill_in :zipcode, with: '80211'

       within '#activity-100021' do #ACCESSIBLE SWIMMING
         check
       end

       click_button 'Submit'
       save_and_open_page


       expect(page).to have_content("Your Profile Has Been Created!")
       save_and_open_page
     end
   end
 end
