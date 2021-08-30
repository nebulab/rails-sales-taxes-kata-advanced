# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:line_items) }
end
