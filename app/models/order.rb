# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def build_from_file(basket_data)
    File.foreach(basket_data.path) do |row|
      row = RowPresenter.new(row)
      line_items.build(quantity: row.quantity, product_id: row.product.id)
    end
    update_order_totals
    self
  end

  private

  def update_order_totals
    total = 0.0
    total_taxes = 0.0
    line_items.each do |li|
      tax = li.product.tax * li.quantity
      total += (li.product.price * li.quantity) + tax
      total_taxes += tax
    end
    update!(total: total, total_taxes: total_taxes)
  end
end
