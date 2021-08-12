class AddItemCategoryReferencesToLineItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :item_category
    add_reference :line_items, :item_category, null: false, foreign_key: true
  end
end
