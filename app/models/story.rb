class Story < ActiveRecord::Base
  belongs_to :project
  has_many :developers
  belongs_to :stage
  belongs_to :creator, :class_name => 'Developer', :foreign_key => 'developer_id'
  validates :title, :presence => true
end
