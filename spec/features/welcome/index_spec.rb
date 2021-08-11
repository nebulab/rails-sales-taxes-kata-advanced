# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Welcome Page' do
  describe 'The welcome landing page', :vcr do
    describe 'When not logged in' do
      it 'Has welcome page and login elements' do
        visit root_path
        expect(page).to have_content('Welcome to the Basket Reader App')
        expect(page).to have_link("Log in", href: new_user_session_path)
        expect(page).to have_link("Sign up now!", href: new_user_registration_path)
        expect(page).to have_link("Home", href: root_path)
        expect(page).to_not have_link("Account")
        expect(page).to_not have_link("My Baskets")
      end
    end

    describe 'When logged in' do
      before do
        @user = FactoryBot.create(:user)
        sign_in(@user)
      end

      it 'Links change to user dropdown menus and basket links elements' do
        visit root_path
        expect(page).to have_link('Account', href: '#')
        expect(page).to have_link('Log out', href: destroy_user_session_path)
        expect(page).to have_link('Profile', href: edit_user_registration_path(@user.id))
        expect(page).to have_link('My Baskets', href: '#')
        expect(page).to_not have_link("Log in", href: new_user_session_path)
        expect(page).to_not have_link("Sign up now!", href: new_user_registration_path)
      end
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
