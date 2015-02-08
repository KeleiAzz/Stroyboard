class Story < ActiveRecord::Base
  belongs_to :project
  has_many :developers
  belongs_to :stage
  validates :title, :presence => true
end
