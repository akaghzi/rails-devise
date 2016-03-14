class Profile < ActiveRecord::Base
  belongs_to :profile_type
  belongs_to :profileable, polymorphic: true
  has_many :details, as: :detailable
  validates :name , presence: true, uniqueness: {case_sensitive: false}
end
