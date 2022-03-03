require 'rails_helper'

RSpec.describe 'users dashboard' do

  it 'displays user information', :vcr do
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
  end

  it 'has a link to delete the user account', :vcr do
    visit "/register"

    user = Faker::Name.first_name

    expect(page).to have_content("Create a New Account")
     fill_in :user_name, with: "#{user}"
     fill_in :email, with: "#{user}@email.com"
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

     click_link("Delete Account")
     expect(current_path).to eq('/')
     expect(page).to have_content("Account successfully deleted")
  end

end
