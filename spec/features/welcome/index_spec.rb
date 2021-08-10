# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Welcome' do
  describe 'The welcome landing page', :vcr do
    it 'Has welcome page and login elements' do
      visit root_path
      expect(page).to have_content('Welcome')
      expect(page).to have_content('Log In')
    end

    it 'cat picture should be randomized each visit' do
      visit root_path
      expect(page).to have_selector('img[alt="cat"]')
      first_image = find("//img[@alt='cat']")['src']
      visit root_path
      second_image = find("//img[@alt='cat']")['src']
      expect(first_image).to_not eq(second_image)
    end
  end
end
