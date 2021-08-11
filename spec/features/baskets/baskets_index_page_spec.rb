# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Baskets Index Page' do
  describe 'When I visit my baskets page' do
    let(:user) { create(:user, :with_baskets) }
    before { sign_in(user) }

    it 'should have a list of all of my baskets' do
      visit baskets_path(user)
      save_and_open_page
      expect(page).to have_selector('.basket-row', count: user.baskets.count)
    end
  end
end
