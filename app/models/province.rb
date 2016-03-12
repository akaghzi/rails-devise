class Province < ActiveRecord::Base
  belongs_to :country
  has_many :cities
  validates :name, :country_id, presence: true
end
