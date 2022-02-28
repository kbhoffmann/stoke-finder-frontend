require 'rails_helper'

RSpec.describe 'Login Form Page' do
  describe 'view' do
    xit 'allows users to login' do
      user_1 = create(:user, name: "David", email: "david@email.com", password: 'password123', password_confirmation: 'password123')

      visit login_path

      fill_in(:email, with: 'david@email.com')
      fill_in(:password, with: 'password123')

      click_button 'Log In'
    end
  end
end
