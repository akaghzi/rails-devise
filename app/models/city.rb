class City < ActiveRecord::Base
  belongs_to :province
  validates :name, :province_id, presence: true
end
