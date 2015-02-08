class RemoveDeveloperColumn < ActiveRecord::Migration
  def change
    remove_column :developers, :admin
  end
end
