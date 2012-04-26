class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :code
      t.text :description
      t.references :project
      t.string :status
      t.integer :percentage
      t.timestamps
    end
    add_foreign_key :issues, :projects
  end
end
