class RenamePointValue < ActiveRecord::Migration
  def change
    rename_column :stories, :point_value, :point_value
  end
end
