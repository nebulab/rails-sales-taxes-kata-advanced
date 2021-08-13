# frozen_string_literal: true

RSpec.describe 'Basket Show Page', type: :feature do
  describe "when I try to visit another user's basket receipt" do
    let(:user) { create(:user) }
    let(:other_user) { create(:basket, :with_items).user }
    before(:each) { sign_in(user) }

    it 'should return me to the main page', :vcr do
      visit basket_path(other_user.baskets.first)
      expect(current_path).to eq(root_path)
    end
  end
end
