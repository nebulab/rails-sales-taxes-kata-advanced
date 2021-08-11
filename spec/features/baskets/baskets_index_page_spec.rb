# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Baskets Index Page' do
  describe 'When I visit my baskets page' do
    let(:user) { create(:user, :with_baskets) }
    let(:other_user) { create(:user, :with_baskets) }
    before { sign_in(user) }

    it 'should have a list of all of my baskets' do
      visit baskets_path(user)
      expect(page).to have_selector('.basket-row', count: user.baskets.count)
    end

    it 'should not see other users baskets' do
      visit baskets_path(user)
      other_user.baskets.each do |basket|
        expect(page).to_not have_selector('.basket-row', text: basket.name)
      end
    end
  end

  describe 'When I visit the baskets page when not logged in' do
    it 'will redirect me to the log in page' do
      visit baskets_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
