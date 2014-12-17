class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
      t.references :product_id, index: true
      t.integer :quantity
      t.decimal :total

      t.timestamps
    end
  end
end
