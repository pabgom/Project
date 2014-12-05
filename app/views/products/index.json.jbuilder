json.array!(@products) do |product|
  json.extract! product, :id, :Name, :Description, :Img_url, :Img_url_file_name, :Img_url_content_type, :Img_url_file_size, :Img_url_updated_at, :Price, :Category_id
  json.url product_url(product, format: :json)
end
