class AddResponsableToProject < ActiveRecord::Migration
  def change
    add_column :projects, :responsable_id, :integer
    add_foreign_key :projects, :users, column: 'responsable_id'
  end
end
