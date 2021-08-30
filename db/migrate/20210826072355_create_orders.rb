# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 10, scale: 2, null: false
      t.decimal :total_taxes, precision: 10, scale: 2, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
