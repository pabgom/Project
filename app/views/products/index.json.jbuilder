json.array!(@products) do |product|
  json.extract! product, :id, :Name, :Description, :Img_url, :Price, :Category_id
  json.url product_url(product, format: :json)
end
