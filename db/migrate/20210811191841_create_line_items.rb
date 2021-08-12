class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.string :description
      t.integer :quantity
      t.float :price
      t.string :item_category
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
