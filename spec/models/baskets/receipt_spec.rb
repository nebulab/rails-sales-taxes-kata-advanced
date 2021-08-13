# frozen_string_literal: true

RSpec.describe Baskets::Receipt do
  let(:basket) { create(:basket, :with_static_items) }
  subject(:receipt) { described_class.new(basket) }

  describe 'initialize' do
    it 'should create a new Receipt object' do
      expect(receipt).to be_a(Baskets::Receipt)
    end
  end

  describe 'adjusted_item_price' do
    let(:taxable_line_item) { create(:line_item, price: 10, quantity: 1, taxable: true) }
    let(:tax_free_line_item) { create(:line_item, price: 10, quantity: 1, tax_free: true) }
    let(:tax_free_imported_line_item) { create(:line_item, price: 10, quantity: 1, tax_free: true, imported: true) }
    let(:taxable_imported_line_item) { create(:line_item, price: 10, quantity: 1, taxable: true, imported: true) }

    it 'should return the adjusted_item_price after tax' do
      expect(receipt.adjusted_item_price(taxable_line_item)).to eq(11.00)
      expect(receipt.adjusted_item_price(tax_free_line_item)).to eq(10.00)
      expect(receipt.adjusted_item_price(taxable_imported_line_item)).to eq(11.50)
      expect(receipt.adjusted_item_price(tax_free_imported_line_item)).to eq(10.50)
    end
  end

  describe 'receipt_line_items' do
    it 'returns and array of formatted line item strings' do
      expect(receipt.receipt_line_items.count).to eq(4)
      expect(receipt.receipt_line_items).to be_a(Array)
      expect(receipt.receipt_line_items.first).to be_a(String)
      expect(receipt.receipt_line_items.first).to be_a(String)
      expect(receipt.receipt_line_items.first).to match(/^[1-9]{1,} [a-zA-z]*: [0-9]*.[0-9]{2}\z/)
    end
  end

  describe 'print_sales_tax' do
    it 'returns the formatted sales tax amount' do
      expect(receipt.print_sales_tax).to be_a(String)
      expect(receipt.print_sales_tax).to match(/^[a-zA-z]* [a-zA-z]*: [0-9]*.[0-9]{2}\z/)
      expect(receipt.sales_tax).to eq(3)
    end
  end

  describe 'print_total' do
    it 'returns the formated basket total amount' do
      expect(receipt.print_total).to be_a(String)
      expect(receipt.print_total).to match(/^[a-zA-z]*: [0-9]*.[0-9]{2}\z/)
      expect(receipt.total).to eq(43.00)
    end
  end
end
