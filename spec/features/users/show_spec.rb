require 'rails_helper'

RSpec.describe 'users dashboard' do

  it 'displays user information', :vcr do
    visit "/dashboard"
    save_and_open_page
  end
end
