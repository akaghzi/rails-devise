class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  belongs_to :address_type
  belongs_to :province
  validates :address_1, :addressable_id, :addressable_type, :address_type_id, :province_id, presence: true
  validates :current, uniqueness: {scope: :addressable}
  before_save {|u|u.postal_code=u.postal_code.upcase}
end