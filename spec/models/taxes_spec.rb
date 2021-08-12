# frozen_string_literal: true

RSpec.describe Taxes do
  let(:taxable_imported_line_item) { create(:line_item, price: 10, quantity: 1, taxable: true, imported: true) }
  let(:taxfree_imported_line_item) { create(:line_item, price: 10, quantity: 1, tax_free: true, imported: true) }
  let(:taxfree_line_item) { create(:line_item, price: 10, quantity: 1, tax_free: true) }
  let(:taxable_line_item) { create(:line_item, price: 10, quantity: 1, taxable: true) }

  describe 'initialize' do
    let(:line_item) { create(:line_item) }
    it 'should create a new Taxes instance' do
      expect(Taxes.new(line_item)).to be_a(Taxes)
    end
  end

  describe 'standard_tax' do
    it "should return tax only if the item is taxable" do
      expect(Taxes.new(taxable_line_item).standard_tax).to eq(0.1)
      expect(Taxes.new(taxfree_line_item).standard_tax).to eq(0)
      expect(Taxes.new(taxfree_imported_line_item).standard_tax).to eq(0)
      expect(Taxes.new(taxable_imported_line_item).standard_tax).to eq(0.1)
    end
  end

  describe 'imported_tax' do
    it "should return import tax only if the item is imported" do
      expect(Taxes.new(taxable_imported_line_item).import_tax).to eq(0.05)
      expect(Taxes.new(taxfree_imported_line_item).import_tax).to eq(0.05)
      expect(Taxes.new(taxable_line_item).import_tax).to eq(0)
      expect(Taxes.new(taxfree_line_item).import_tax).to eq(0)
    end
  end

  describe 'applicable_tax' do
    it "should return the sum of the applied taxes" do
      expect(Taxes.new(taxable_imported_line_item).applicable_tax).to eq(0.15)
      expect(Taxes.new(taxfree_imported_line_item).applicable_tax).to eq(0.05)
      expect(Taxes.new(taxable_line_item).applicable_tax).to eq(0.1)
      expect(Taxes.new(taxfree_line_item).applicable_tax).to eq(0)
    end
  end

  describe 'calculated_taxes' do
    it "should return the product of the taxes, item quantity and price" do
      expect(Taxes.new(taxable_imported_line_item).calculated_taxes).to eq(1.50)
      expect(Taxes.new(taxfree_imported_line_item).calculated_taxes).to eq(0.50)
      expect(Taxes.new(taxable_line_item).calculated_taxes).to eq(1.00)
      expect(Taxes.new(taxfree_line_item).calculated_taxes).to eq(0.00)
    end
  end
end
