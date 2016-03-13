class Contact < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
  validates :contactable_id, :contactable_type, :phone, presence: true
  
end
