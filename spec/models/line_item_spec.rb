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
end
