# frozen_string_literal: true

class LineItem < ApplicationRecord
  before_validation :set_category

  belongs_to :basket, optional: true
  belongs_to :item_category

  validates :quantity, numericality: {
    only_integer: true,
    greater_than: -1
  }
  validates :price, numericality: {
    greater_than: 0
  }

  private

  def set_category
    return if item_category.present?

    self.item_category = LineItem.select { |line_item| description&.include?(line_item.description) }&.first&.item_category
  end
end
