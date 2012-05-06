# -*- encoding : utf-8 -*-
class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :name,           null: false
      t.integer :creator_id,     null: false
      t.integer :responsable_id
      t.timestamps
    end
    add_foreign_key :projects, :users, column: 'creator_id'
    add_foreign_key :projects, :users, column: 'responsable_id'
  end
end
