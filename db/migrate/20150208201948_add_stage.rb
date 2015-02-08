class AddStage < ActiveRecord::Migration
  def change
    add_column :stories, :stage, :string
  end
end
