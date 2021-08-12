# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ['Medicine', 'Book', 'Food', 'Others']

categories.each do |category|
  ItemCategory.find_or_create_by(name: category)
end

line_item_descriptions = {'book' => 'Book', 'chocolate bar' => 'Food',
                          'music CD' => 'Others', 'box of chocolates' => 'Food',
                          'bottle of perfume' => 'Others', 'headache pills' => 'Medicine'
}

line_item_descriptions.each do |line_item_description, category|
  LineItem.find_or_create_by(description: line_item_description, item_category: ItemCategory.find_by(name: category),
                             price: 1, quantity: 1)
end
