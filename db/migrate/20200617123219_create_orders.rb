class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :item_name
      t.float :price
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
