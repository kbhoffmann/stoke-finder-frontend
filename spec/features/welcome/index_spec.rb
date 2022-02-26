require 'rails_helper'

RSpec.describe 'Welcom Index Page' do
  describe 'view' do
    # before(:each) do
    #   @user_1 = create(:user, name: "David", email: "david@email.com", password: 'password123', password_confirmation: 'password123')
    #
    #   visit login_path
    #
    #   fill_in(:email, with: 'david@email.com')
    #   fill_in(:password, with: 'password123')
    #
    #   click_button 'Log In'
    # end

    it 'has a title' do

      visit root_path

      expect(page).to have_content("Welcome to Stoke Finder!")
    end

    # it 'allows the user to log in' do
    #   # click_link 'Logout'
    #   user_2 = FactoryBot.create(:user)
    #   visit root_path
    #
    #   click_link 'Log In'
    #   expect(current_path).to eq(login_path)
    #
    #   fill_in(:email, with: "#{user_2.email}")
    #   fill_in(:password, with: "#{user_2.password}" )
    #
    #   click_button 'Log In'
    # end
    #
    # it 'includes a link to register a new user' do
    #   visit root_path
    #   # click_link 'Logout'
    #
    #   click_link 'Register'
    #   expect(current_path).to eq("/register")
    #
    #   fill_in :name, with: 'Robin'
    #   fill_in :email, with: 'robin@email.com'
    #   fill_in :password, with: 'password12345'
    #   fill_in :password_confirmation, with: 'password12345'
    #   click_button 'Submit'
    #
    #   expect(page).to have_content("Robin's Dashboard")
    #   expect(current_path).to eq(dashboard_path(User.last))
    # end
    #
    # it 'allows the user to Search for Adventures' do
    #   visit root_path
    #
    #   click_link 'Search for Adventures'
    #
    #   expect(current_path).to eq("/adventures/search")
    #   expect(page).to have_content("StokeFinder: Lets Find Your Stoke")
    # end
  end
end
