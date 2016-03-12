class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :province
  validates :name, :coutry_id, :province_id, presence: true
end
