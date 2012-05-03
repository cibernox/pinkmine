# -*- encoding : utf-8 -*-
class AddPersonalDataToUser < ActiveRecord::Migration
  def change
    add_column :users, :name,     :string
    add_column :users, :surname1, :string
    add_column :users, :surname2, :string
    add_column :users, :born_on,  :date
    add_column :users, :twitter,  :string
    add_column :users, :github,   :string
  end
end
