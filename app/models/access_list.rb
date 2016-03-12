class AccessList < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  belongs_to :property
  belongs_to :role
  validates :user_id, :role_id, presence: true
  validates :user_id, uniqueness: {scope: [:company, :property, :role]}
end
