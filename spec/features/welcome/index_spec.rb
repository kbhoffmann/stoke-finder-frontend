require 'rails_helper'

RSpec.describe 'Welcom Index Page' do
  describe 'view' do
    it 'has a title' do
      visit root_path

      expect(page).to have_content("Welcome to StokeFinder!")
    end

    it 'allows the user to log in' do
      # user_1 = User.create!(name: "David", email: "david@email.com", password: 'password123', password_confirmation: 'password123')
      visit root_path

      click_link 'Log In'
      expect(current_path).to eq(login_path)

      # fill_in(:email, with: 'robin@email.com')
      # fill_in(:password, with: 'password123')
      #
      # click_button 'Log In'
    end
  end
end
