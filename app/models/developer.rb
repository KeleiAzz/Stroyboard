class Developer < ActiveRecord::Base
  has_many :story
  belongs_to :project

  validates :name, length: { maximum: 32 }, :presence => true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 64 }, :presence => true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  validates :password, length: { maximum: 32, minimum: 6 },
            :presence => true

  has_secure_password
end
