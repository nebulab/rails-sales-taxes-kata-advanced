# frozen_string_literal: true

module LineItems
  class ItemCategory
    attr_reader :category

    def self.delegate_category(description)
      description = description.downcase
      return 'Food' if item_match(['chocolate'], description)
      return 'Medicine' if item_match(['pills'], description)
      return 'Book' if item_match(['book'], description)

      'Other'
    end

    def self.item_match(array, description)
      array.any? { |item| description.include?(item) }
    end
  end
end
