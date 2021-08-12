# frozen_string_literal: true

FactoryBot.define do
  factory :basket do
    sequence(:name) { |n| "basket #{n}" }
    user

    trait :with_items do
      after(:create) do |basket|
        FactoryBot.create_list(:line_item, 4, basket: basket)
      end
    end

    trait :with_static_items do
      after(:create) do |basket|
        FactoryBot.create(:line_item, tax_free: true, price: 10, quantity: 1, basket: basket)
        FactoryBot.create(:line_item, taxable: true, price: 10, quantity: 1, basket: basket)
        FactoryBot.create(:line_item, taxable: true,
                          imported: true, price: 10, quantity: 1, basket: basket)
        FactoryBot.create(:line_item, tax_free: true,
                          imported: true, price: 10, quantity: 1, basket: basket)
      end
    end
  end
end
