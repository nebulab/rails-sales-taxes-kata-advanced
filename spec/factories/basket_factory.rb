# frozen_string_literal: true

FactoryBot.define do
  factory :basket do
    sequence(:name) { |n| "basket #{n}" }
    user
  end
end
