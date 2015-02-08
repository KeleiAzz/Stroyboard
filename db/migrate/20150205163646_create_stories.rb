class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.integer :point_value
      t.text :content
      t.references :project
      t.references :stage
      t.timestamps #null: false
    end
  end
end
