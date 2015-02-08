class Story < ActiveRecord::Base
  belongs_to :project
  has_many :developers
  validates :title, :presence => true
end
