json.array!(@company_services) do |company_service|
  json.extract! company_service, :id, :company_id, :service_id, :description
  json.url company_service_url(company_service, format: :json)
end
