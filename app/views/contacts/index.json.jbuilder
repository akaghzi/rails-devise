json.array!(@contacts) do |contact|
  json.extract! contact, :id, :contactable_id, :contactable_type, :phone, :fax, :website, :email, :twitter, :facebook, :linkedin, :googleplus
  json.url contact_url(contact, format: :json)
end
