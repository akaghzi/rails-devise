class Detail < ActiveRecord::Base
  belongs_to :detailable, polymorphic: true
  validates :content , presence: true, uniqueness: {case_sensitive: false}
end
