# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'password' }

    trait :with_baskets do
      after(:create) do |user|
        FactoryBot.create_list(:basket, 3, user: user)
      end
    end
  end
end
