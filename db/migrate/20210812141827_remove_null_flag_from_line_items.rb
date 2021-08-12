class RemoveNullFlagFromLineItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :line_items, :basket_id, true
  end
end
