# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Baskets Index Page' do
  describe 'When I visit my baskets page' do
    let(:user) { create(:user, :with_baskets) }
    let(:other_user) { create(:user, :with_baskets) }

    before do
      sign_in(user)
      visit baskets_path(user)
    end

    it 'should have a list of all of my baskets' do
      expect(page).to have_selector('.basket-row', count: user.baskets.count)
    end

    it 'should not see other users baskets' do
      other_user.baskets.each do |basket|
        expect(page).to_not have_selector('.basket-row', text: basket.name)
      end
    end

    it 'should delete a basket if I click on the "Delete" link' do
      user_basket_count = user.baskets.count
      find('.basket-row', match: :first).click_link('Delete')
      expect(user.baskets.count).to eq(user_basket_count - 1)
      expect(page).to have_selector('.basket-row', count: user_basket_count - 1)
    end
  end

  describe 'When I visit the baskets page when not logged in' do
    it 'will redirect me to the log in page' do
      visit baskets_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
