class Country < ActiveRecord::Base
  has_many :provinces
  has_many :cities
  validates :name, uniqueness: {case_sensitive: false}, presence: true
end
