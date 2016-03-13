class CompanyService < ActiveRecord::Base
  belongs_to :company
  belongs_to :service
  validates :company_id, :service_id, :description, presence: true
end
