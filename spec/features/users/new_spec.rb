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

      visit "/register"
      click_link "Search for Adventures"
      expect(current_path).to eq("/adventures/search")
    end

    it 'has a title and fields to fill out for new users', :vcr do
      visit "/register"


      expect(page).to have_content("Create a New Account")
       fill_in :user_name, with: 'Robin7'
       fill_in :email, with: 'robin7@email.com'
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

       expect(page).to have_content("Welcome Borton Preekers!")
     end
   end
 end
