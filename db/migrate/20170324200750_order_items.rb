class OrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.integer :count, null: false
      t.string :direction, null: false
    end
  end
end
