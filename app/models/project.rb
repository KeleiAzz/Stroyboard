class Project < ActiveRecord::Base
  has_many :stories
  has_many :developers

  validates :name, length: { maximum: 32 }, :presence => true
  validates :description, length: { maximum: 255 }, :presence => true
end
