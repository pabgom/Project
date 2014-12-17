class AddOrderToOrderItems < ActiveRecord::Migration
  def change
    add_reference :orderitems, :order, index: true
  end
end
