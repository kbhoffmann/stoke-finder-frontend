require 'rails_helper'

RSpec.describe 'users dashboard' do

  it 'displays user information', :vcr do
    visit "/dashboard"
  end

  it 'has a link to the user edit form', :vcr do

    visit "/dashboard"

    click_link "Update Account"

    expect(current_path).to eq('/users/edit')
  end
end
