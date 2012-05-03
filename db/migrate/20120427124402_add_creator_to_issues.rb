# -*- encoding : utf-8 -*-
class AddCreatorToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :creator_id, :integer
    add_foreign_key :issues, :users, column_name: 'creator_id'
  end
end
