class Role < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :role_type, inclusion: {in: %w(Company Property)}

end
