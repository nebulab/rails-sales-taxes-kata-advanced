# frozen_string_literal: true

class LineItem < ApplicationRecord
  before_save :set_category
  belongs_to :basket

  validates :quantity, numericality: {
    only_integer: true,
    greater_than: -1
  }
  validates :price, numericality: {
    greater_than: 0
  }

  private

  def set_category
    self.item_category = LineItems::ItemCategory.delegate_category(description)
  end
end
