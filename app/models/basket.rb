# frozen_string_literal: true

class Basket < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  def add_items(file)
    BasketReader.read_basket(file).each do |line_item|
      line_items << line_item
    end
  end
end
