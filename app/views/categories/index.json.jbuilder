json.array!(@categories) do |category|
  json.extract! category, :id, :Name
  json.url category_url(category, format: :json)
end
