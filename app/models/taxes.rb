# frozen_string_literal: true

class Taxes
  def initialize(item)
    @item = item
  end

  def applicable_tax
    (standard_tax + import_tax).round(2)
  end

  def standard_tax
    @item.item_category == "Other" ? 0.1 : 0
  end

  def import_tax
    @item.description.downcase.include?("import") ? 0.05 : 0
  end

  def calculated_taxes
    ((applicable_tax * @item.price * @item.quantity * 20).ceil / 20.00).round(2)
  end
end
