require 'rails_helper'

RSpec.describe 'User Edit Page' do
  it 'can update the user attributes', :vcr do

    visit "/register"

    expect(page).to have_content("Create a New Account")
     fill_in :user_name, with: "#{rand.to_s}"
     fill_in :email, with: "#{rand.to_s}@#{rand.to_s}.com"
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
     expect(current_path).to eq('/dashboard')
     click_link "Update Account"
     expect(current_path).to eq('/edit')

     fill_in :user_name, with: "#{rand.to_s}"
     fill_in :password, with: 'password12345'
     fill_in :password_confirmation, with: 'password12345'
     fill_in :street_address, with: '3557 Alcott St'
     fill_in :city, with: 'Denver'
     fill_in :state, with: 'CO'
     fill_in :zipcode, with: '80211'

     within '#activity-100049' do #ACCESSIBLE SWIMMING
       check
     end

     within '#activity-100050' do #SOFTBALL
       check
     end

     click_button 'Update Profile'
   end
end
