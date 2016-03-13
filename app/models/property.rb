class Property < ActiveRecord::Base
  belongs_to :company
  has_many :access_lists
  has_many :addresses, as: :addressable
  validates :name, :company_id, presence: true
end