# frozen_string_literal: true

Rails.application.routes.draw do
  get 'baskets/index'
  devise_for :users
  resources :baskets, except: [:update, :edit]

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
