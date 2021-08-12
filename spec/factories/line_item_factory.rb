# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    transient do
      imported { false }
      taxable { false }
      tax_free { false }
    end

    description { ['book', 'box of chocolates', 'headache pills', 'bottle of perfume'].sample }
    quantity { rand(1..10) }
    price { rand(1.00..10.00) }
    basket

    before(:create) do |line_item, evaluator|
      line_item.description = 'bottle of perfume' if evaluator.taxable
      line_item.description = 'book' if evaluator.tax_free
      line_item.description << ' imported' if evaluator.imported
    end
  end
end
