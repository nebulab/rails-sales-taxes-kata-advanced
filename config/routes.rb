# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :orders, except: [:destroy]
  root to: 'home#index'
end
