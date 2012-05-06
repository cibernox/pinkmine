# -*- encoding : utf-8 -*-
class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string     :title,          null: false
      t.string     :code,           null: false, limit: 10
      t.text       :description,    null: false
      t.references :project,        null: false
      t.string     :status
      t.integer    :percentage
      t.integer    :creator_id,     null: false
      t.integer    :responsable_id
      t.timestamps
    end
    add_foreign_key :issues, :projects
    add_foreign_key :issues, :users, column: 'creator_id'
    add_foreign_key :issues, :users, column: 'responsable_id'
  end
end
