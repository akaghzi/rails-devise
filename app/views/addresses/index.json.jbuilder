json.array!(@addresses) do |address|
  json.extract! address, :id, :addressable_id, :addressable_type, :address_1, :address_2, :province_id, :city, :postal_code
  json.url address_url(address, format: :json)
end
