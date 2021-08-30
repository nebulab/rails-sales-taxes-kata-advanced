# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:line_items).dependent(:destroy) }
  end

  describe '#build_from_file' do
    let!(:user) { create(:user) }
    let!(:order) { user.orders.new }
    let!(:file_path) { Rails.root.join('spec', 'support', 'test_data', 'basket_3.txt') }
    let!(:file) { Rack::Test::UploadedFile.new(file_path) }

    subject { order.build_from_file(file) }

    it 'creates an order with line_items and products' do
      order = subject
      expect(order).not_to be_nil
      expect(order.total.to_s).to eq('74.68')
      expect(order.total_taxes.to_s).to eq('6.7')
      expect(order.line_items.count).to eq(4)
      expect(order.line_items.sum(:quantity)).to eq(4)
    end
  end
end
