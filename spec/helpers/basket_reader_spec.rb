# frozen_string_literal: true

RSpec.describe 'BasketReader' do
  describe 'self.line_item' do
    it 'builds a LineItem from parsed text' do
      item_text = '1 book at 12.49'
      item = BasketReader.line_item(item_text)

      expect(item.description).to eq('book')
      expect(item.quantity).to eq(1)
      expect(item.price).to eq(12.49)
    end
  end

  describe 'self.parse_items' do
    let(:file) { file_fixture('basket_1.txt').read.split(/\n/) }

    it 'parses a string of items into a list of LineItems' do
      line_items = BasketReader.parse_items(file)
      expect(line_items.size).to eq(3)
    end
  end

  describe 'self.read_basket' do
    let(:file) { file_fixture('basket_1.txt') }

    it 'reads a file and returns an array of line items' do
      line_items = BasketReader.read_basket(file)
      expect(line_items.size).to eq(3)
      expect(line_items.class).to eq(Array)
      expect(line_items.first.class).to eq(LineItem)
    end
  end
end
