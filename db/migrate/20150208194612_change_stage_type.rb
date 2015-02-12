class ChangeStageType < ActiveRecord::Migration
  def change
    change_column :stories, :stage_id, :string
  end
end
