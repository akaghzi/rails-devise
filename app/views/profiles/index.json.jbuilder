json.array!(@profiles) do |profile|
  json.extract! profile, :id, :profile_type_id, :profileable_id, :profileable_type, :name
  json.url profile_url(profile, format: :json)
end
