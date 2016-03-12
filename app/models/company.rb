class Company < ActiveRecord::Base
  belongs_to :user
  has_many :services
  validates :name, :user_id, presence: true
end
