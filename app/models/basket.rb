# frozen_string_literal: true

class Basket < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
end
