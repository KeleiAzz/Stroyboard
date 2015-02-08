class Developer < ActiveRecord::Base
  belongs_to :story
  belongs_to :project
  validates :name, :presence => true
  validates :email, :presence => true
  has_secure_password
end
