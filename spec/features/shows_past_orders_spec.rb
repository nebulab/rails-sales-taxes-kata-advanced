# frozen_string_literal: true

require 'rails_helper'

describe 'View Past Orders', type: :feature do
  let!(:user) { create(:user) }
  let!(:order1) { create(:order, user: user) }
  let!(:order2) { create(:order, user: user) }
  let!(:order3) { create(:order, user: user) }

  before do
    sign_in user
  end

  describe 'visiting past orders' do
    it 'contains the past order links' do
      visit orders_path

      expect(page).to have_selector("a[href='#{order_path(order1)}']")
      expect(page).to have_selector("a[href='#{order_path(order2)}']")
      expect(page).to have_selector("a[href='#{order_path(order3)}']")
    end
  end
end
