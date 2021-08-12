# frozen_string_literal: true

RSpec.describe LineItem do
  describe 'validations' do
    it do
      should validate_numericality_of(:price).is_greater_than(0)
      should validate_numericality_of(:quantity).is_greater_than(-1)
    end
  end

  describe 'relationships' do
    it { should belong_to :basket }
  end

  describe 'set_category' do
    let(:basket) { create(:basket) }
    it 'should set item_category column for LineItem before saving' do
      line_item = BasketReader.line_item('1 book at 12.49')
      expect(line_item.item_category).to eq(nil)
      basket.line_items << line_item
      expect(line_item.item_category).to eq('Book')
    end
  end
end
