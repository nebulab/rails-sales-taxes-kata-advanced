# frozen_string_literal: true

RSpec.describe LineItems::ItemCategory do
  describe 'self.delegate_category' do
    it 'should return the correct category' do
      description = 'Dino Books'
      expect(described_class.delegate_category(description)).to eq("Book")
      description = 'Tylenol Pills'
      expect(described_class.delegate_category(description)).to eq("Medicine")
      description = 'Chocolate Candy'
      expect(described_class.delegate_category(description)).to eq("Food")
      description = 'Spotted Umbrella'
      expect(described_class.delegate_category(description)).to eq("Other")
    end
  end
end
