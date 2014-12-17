class AddOrderToOrderItem < ActiveRecord::Migration
  def change
		add_column :orderitems, :order_id, :integer
    add_reference :orderitems, :order_id, index: true
  end
end
