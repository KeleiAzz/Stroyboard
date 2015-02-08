class Project < ActiveRecord::Base
  has_many :stories
  has_many :developers
  validates :name, :presence => true
  validates :description, :presence => true

end
