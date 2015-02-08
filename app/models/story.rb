class Story < ActiveRecord::Base
  belongs_to :project
  has_many :developers

  validates :title, length: { maximum: 32 }, :presence => true
  validates :description, length: { maximum: 255 }, :presence => true
  validates :point, :presence => true,
            :numericality => { :greater_than_or_equal_to => 0,
                               :less_than_or_equal_to => 100 }
  validates :content, length: { maximum: 255 }, :presence => true
end
