json.array!(@orders) do |order|
  json.extract! order, :id, :user_id_id, :total
  json.url order_url(order, format: :json)
end
