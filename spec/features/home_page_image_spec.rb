# frozen_string_literal: true

require 'rails_helper'

describe 'Home Page Image', type: :feature do
  describe 'visiting home page', js: true do
    it 'shows an image of a cat' do
      visit root_path
      sleep 2
      expect(find('img#cat-image')[:src]).to include('https://cdn2.thecatapi.com')
    end
  end
end
