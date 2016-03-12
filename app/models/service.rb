class Service < ActiveRecord::Base
  belongs_to :company
  validates :name, :cmpany_id, presence: true
end
