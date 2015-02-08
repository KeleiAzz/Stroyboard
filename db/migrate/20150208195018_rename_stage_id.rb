class RenameStageId < ActiveRecord::Migration
  def change
    rename_column :stories, :stage_id, :stage
  end
end
