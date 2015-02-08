class AddDeveloperReference < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.references :developer
    end
  end
end
