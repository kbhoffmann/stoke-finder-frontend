require 'rails_helper'

RSpec.describe 'Login Form Page' do
  describe 'view' do
    context 'happy path' do
      it 'allows users to login', :vcr do
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
        click_button 'Logout'

        visit login_path

        fill_in(:user_name, with: "#{user}")
        fill_in(:password, with: 'password12345')

        click_button 'Sign In'
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Welcome back")
      end
    end

    context 'sad path' do
      it 'gives an error when incorrect data is given' do
        VCR.use_cassette('incorrect-login') do
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
          click_button 'Logout'

          visit login_path
          #incorrect password
          fill_in(:user_name, with: "#{user}")
          fill_in(:password, with: 'password')

          click_button 'Sign In'
          expect(current_path).to eq('/login')
          expect(page).to have_content('Invalid username or password')
          #invalid user_name
          fill_in(:user_name, with: "Garth Brooks")
          fill_in(:password, with: 'password12345')
          click_button 'Sign In'
          expect(current_path).to eq('/login')
          expect(page).to have_content('Invalid username or password')
        end
      end
    end
  end
end
