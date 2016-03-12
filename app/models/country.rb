class Country < ActiveRecord::Base
  has_many :provinces
  has_many :cities
  validates :name, presence: true
end
