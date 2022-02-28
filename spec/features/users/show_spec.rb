require 'rails_helper'

RSpec.describe 'users dashboard' do

  it 'displays user information', :vcr do
    visit "/dashboard"
  end
end
