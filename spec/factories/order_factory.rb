# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    total { '10' }
    total_taxes { '2' }
    user { create(:user) }
  end
end
