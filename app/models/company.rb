class Company < ActiveRecord::Base
  belongs_to :user
  has_many :access_lists
  has_many :addresses, as: :addressable
  has_many :contacts, as: :contactable
  has_many :company_services
  has_many :services, through: :company_services
  validates :name, :user_id, presence: true
end