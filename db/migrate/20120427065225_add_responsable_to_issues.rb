class AddResponsableToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :responsable_id, :integer
    add_foreign_key :issues, :users, column: 'responsable_id'
  end
end
