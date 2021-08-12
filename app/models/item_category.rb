# frozen_string_literal: true

class ItemCategory < ApplicationRecord
  has_many :line_items, dependent: :destroy
end
