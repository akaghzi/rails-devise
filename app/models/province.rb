class Province < ActiveRecord::Base
  belongs_to :country
  has_many :cities
  has_many :addresses, as: :addressable
  validates :name, :country_id, presence: true
  validates :name, uniqueness: {case_sesitive: false, scope: :country}
end
