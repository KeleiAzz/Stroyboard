class RemoveReference < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.remove :stage
    end
  end
end
