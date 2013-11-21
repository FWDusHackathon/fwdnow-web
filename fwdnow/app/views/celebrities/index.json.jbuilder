json.array!(@celebrities) do |celebrity|
  json.extract! celebrity, :name, :message
  json.url celebrity_url(celebrity, format: :json)
end
