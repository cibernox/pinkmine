# -*- encoding : utf-8 -*-
class AddCreatorToProject < ActiveRecord::Migration
  def change
    add_column :projects, :creator_id, :integer
    add_foreign_key :projects, :users, column: 'creator_id'
  end
end
