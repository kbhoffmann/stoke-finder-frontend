require 'rails_helper'

RSpec.describe UserFacade do
  context 'class methods' do
    context '::login_user' do
      it 'returns user data' do
        VCR.use_cassette('login-user') do
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

          user_data = {user: "#{user}", password: 'password12345'}
          user = UserFacade.login_user(user_data)

          expect(user).to be_a(Hash)
          expect(user).to have_key(:data)

          expect(user[:data]).to have_key(:id)
          expect(user[:data][:id]).to be_a(String)
        end
      end
    end
  end
end
