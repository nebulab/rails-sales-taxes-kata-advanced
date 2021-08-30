# frozen_string_literal: true

require 'rails_helper'

describe 'Upload a basket', type: :feature do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'uploads a file and calculates totals correctly' do
    it 'returns the correct totals' do
      visit new_order_path

      attach_file('order_basket_data', "#{Rails.root}/spec/support/test_data/basket_1.txt")
      find(:xpath, "//input[@type='submit']").click

      expect(page).to have_content('1.50')
      expect(page).to have_content('29.83')
      expect(page).to have_content('book')
      expect(page).to have_content('music CD')
      expect(page).to have_content('chocolate bar')
    end
  end
end
