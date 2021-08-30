# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  let!(:user) { create(:user) }

  describe 'when signed in' do
    before(:each) do
      sign_in user
    end

    context 'GET /orders' do
      it 'returns http success' do
        get '/orders'
        expect(response).to have_http_status(:success)
      end
    end

    context 'GET /show' do
      let!(:order) { create(:order, user: user) }
      it 'returns http success' do
        get order_path(order)
        expect(response).to have_http_status(:success)
      end
    end

    context 'GET /new' do
      it 'returns http success' do
        get '/orders/new'
        expect(response).to have_http_status(:success)
      end
    end

    context 'GET /create' do
      it 'returns http success' do
        post orders_path, params: {
          order: {
            basket_data: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/test_data/basket_1.txt")
          }
        }
        expect(response).to redirect_to(order_path(Order.last))
      end
    end
  end

  describe 'when not signed in' do
    context 'GET /orders' do
      it 'redirects to login path' do
        get '/orders'
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'GET /show' do
      let!(:order) { create(:order, user: user) }
      it 'redirects to login path' do
        get '/orders/1'
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'GET /new' do
      it 'redirects to login path' do
        get '/orders/new'
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'GET /create' do
      it 'returns http success' do
        post orders_path, params: {
          order: {
            basket_data: Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/test_data/basket_1.txt")
          }
        }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
