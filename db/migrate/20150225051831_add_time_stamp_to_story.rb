class AddTimeStampToStory < ActiveRecord::Migration
  def change
    add_column :stories, :finishTime, :integer
  end
end
