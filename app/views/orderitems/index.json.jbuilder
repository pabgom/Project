json.array!(@orderitems) do |orderitem|
  json.extract! orderitem, :id, :product_id_id, :quantity, :total
  json.url orderitem_url(orderitem, format: :json)
end
