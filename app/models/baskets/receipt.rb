# frozen_string_literal: true

module Baskets
  class Receipt
    attr_reader :sales_tax, :total

    def initialize(basket)
      @basket = basket
      @sales_tax = 0.0
      @total = 0.0
      @line_items = receipt_line_items
    end

    def print_sales_tax
      "Sales Taxes: #{'%.2f' % @sales_tax}"
    end

    def print_total
      "Total: #{'%.2f' % @total}"
    end

    def add_to_total(price)
      @total += price
    end

    def add_to_taxes(taxes)
      @sales_tax += taxes
    end

    def adjusted_item_price(item)
      taxes = Taxes.new(item).calculated_taxes
      add_to_taxes(taxes)
      taxes + item.price
    end

    def receipt_line_items
      @basket.line_items.map do |item|
        adjusted_price = adjusted_item_price(item)
        add_to_total(adjusted_price)
        "#{item.quantity} #{item.description}: #{'%.2f' % adjusted_price}"
      end
    end
  end
end
