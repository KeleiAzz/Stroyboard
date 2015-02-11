class Story < ActiveRecord::Base
  has_many :developers
  belongs_to :creator, :class_name => 'Developer', :foreign_key => 'developer_id'

  validates :title, length: { maximum: 32 }, :presence => true
  validates :description, length: { maximum: 255 }, :presence => true
  validates :point, :presence => true,
            :numericality => { :greater_than_or_equal_to => 0,
                               :less_than_or_equal_to => 100 }
  validates :content, length: { maximum: 255 }, :presence => true
end
