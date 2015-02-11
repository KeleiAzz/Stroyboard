class RemovePasswordColumn < ActiveRecord::Migration
  def change
    remove_column :admins, :password
  end
end
