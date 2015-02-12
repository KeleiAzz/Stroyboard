class Admin < ActiveRecord::Base
  validates :name, length: { maximum: 32 }, :presence => true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 64 }, :presence => true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  validates :password, length: { maximum: 32, minimum: 6 },on: :create,
            :presence => true
  validates :password, length: {minimum: 6, maximum: 32}, on: :update, allow_blank: true

  has_secure_password
end
