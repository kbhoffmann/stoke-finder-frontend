require 'rails_helper'

RSpec.describe 'Rec Area Show Page', type: :view do
  it 'links to the show page from the search page', :vcr do
    visit "/rec_areas/search"

    id = "284"

    fill_in "Search all activites by Location(City, State)", with: "Denver, CO"
    within '#200' do
      check
    end
    click_button "Search by Location"

    expect(current_path).to eq("/rec_areas/search_by_location")
    expect(page).to have_content("Chatfield Lake")
    click_link("Chatfield Lake Details")
    expect(current_path).to eq("/rec_areas/#{id}")
    expect(page).to have_content("Chatfield Lake")
    expect(page).to have_content("Fees")
    expect(page).to have_content("Phone number")
    expect(page).to have_content("Activities for Chatfield Lake:")
    expect(page).to have_content("Weather for Chatfield Lake")
  end
end
