class Admin < ActiveRecord::Base
  validates :email, presence: true
  has_secure_password
end
