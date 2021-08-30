# frozen_string_literal: true

class RowPresenter
  attr_reader :name, :price, :tax, :quantity, :product

  TAX_EXEMPTION_LIST = %w[chocolate pill book].freeze

  def initialize(row)
    @row = row.split(' ')
    @quantity = row[0].to_i
    @name = set_product_name
    @price = set_product_price
    @tax = set_product_tax
    @product = Product.find_or_create_by!(name: @name, price: @price, tax: @tax)
  end

  private

  def set_product_name
    name = []
    @row.each_with_index do |_item, index|
      break if @row[index + 1] == 'at'

      name << @row[index + 1]
    end
    name.join(' ')
  end

  def set_product_price
    @row[-1].to_f
  end

  def set_product_tax
    if tax_exempt && imported
      round_tax(@price * 0.05)
    elsif !tax_exempt && imported
      round_tax(@price * 0.15)
    elsif tax_exempt && !imported
      0
    else
      round_tax(@price * 0.1)
    end
  end

  def tax_exempt
    @tax_exempt ||=
      TAX_EXEMPTION_LIST.any? do |category|
        @name.include?(category) || @name.include?(category.pluralize)
      end
  end

  def imported
    @imported ||= @row.include?('imported')
  end

  def round_tax(un_rounded_tax)
    ((un_rounded_tax * 20).ceil * 0.05).round(2)
  end
end
