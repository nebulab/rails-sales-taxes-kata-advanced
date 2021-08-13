# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Basket Creation Page', type: :feature do
  let(:user) { create(:user) }
  before { sign_in(user) }

  describe 'I upload basket 2 list and click create' do
    it 'redirects me to the Basket show page with an itemized receipt' do
      visit new_basket_path
      attach_file('basket[basket_file]', file_fixture('basket_2.txt'))
      click_button('Create')

      expect(page).to have_content('10.50')
      expect(page).to have_content('54.65')
      expect(page).to have_content('7.65')
      expect(page).to have_content('65.15')
    end
  end

  describe 'I upload basket 1 list and click create' do
    it 'redirects me to the Basket show page with an itemized receipt' do
      visit new_basket_path
      attach_file('basket[basket_file]', file_fixture('basket_1.txt'))
      click_button('Create')

      expect(page).to have_content('12.49')
      expect(page).to have_content('16.49')
      expect(page).to have_content('0.85')
      expect(page).to have_content('1.50')
      expect(page).to have_content('29.83')
    end
  end

  describe 'I upload basket 3 list and click create' do
    it 'redirects me to the Basket show page with an itemized receipt' do
      visit new_basket_path
      attach_file('basket[basket_file]', file_fixture('basket_3.txt'))
      click_button('Create')

      expect(page).to have_content('32.19')
      expect(page).to have_content('20.89')
      expect(page).to have_content('9.75')
      expect(page).to have_content('11.85')
      expect(page).to have_content('6.70')
      expect(page).to have_content('74.68')
    end
  end

  describe 'I upload basket 4 with an invalid item in the list and click create' do
    it 'redirects me to the Basket create page with errors displayed' do
      visit new_basket_path
      attach_file('basket[basket_file]', file_fixture('basket_4.txt'))
      click_button('Create')
      expect(current_path).to eq(new_basket_path)
      expect(page).to have_content('Line items is invalid')
    end
  end

  describe 'I attempt to upload an invalid file format' do
    it 'redirects me to the Basket create page with errors displayed' do
      visit new_basket_path
      attach_file('basket[basket_file]', file_fixture('basket.csv'))
      click_button('Create')
      expect(current_path).to eq(new_basket_path)
      expect(page).to have_content('File type not allowed')
    end
  end
end
