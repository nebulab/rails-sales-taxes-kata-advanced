# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CatImageService do
  it 'fetches an image of a cat', :vcr do
    expect(CatImageService.get_image).to match(/https:\/\/cdn2.thecatapi.com\/images\/.*/)
  end
end
