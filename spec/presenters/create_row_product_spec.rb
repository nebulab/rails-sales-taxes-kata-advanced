# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RowPresenter, type: :presenter do
  describe 'initializing a new row' do
    let!(:file_path) { Rails.root.join('spec/support/test_data/basket_3.txt') }
    let!(:row) { File.open(file_path, &:gets) }

    subject { RowPresenter.new(row) }

    it 'creates a row with the correct attributes' do
      row = subject
      expect(row.quantity).to eq(1)
      expect(row.name).to eq('imported bottle of perfume')
      expect(row.price.to_s).to eq('27.99')
      expect(row.tax.to_s).to eq('4.2')
      expect(row.product).to eq(Product.first)
    end
  end
end
