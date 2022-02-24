require 'rails_helper'

RSpec.describe 'Welcom Index Page' do
  describe 'view' do
    it 'has a title' do
      visit root_path

      expect(page).to have_content("Welcome to StokeFinder!")
    end
  end
end
