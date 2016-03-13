class Service < ActiveRecord::Base
  has_many :company_services
  has_many :companies, through: :company_services
  validates :name, presence: true, uniqueness: {case_sensituve: false}
end
