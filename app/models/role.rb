class Role < ActiveRecord::Base
  has_many :access_lists
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :role_type, inclusion: {in: %w(company property)}
  before_save {|role|role.name=role.name.downcase}
end