# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,           null: false
      t.string :email,              default: nil
      t.string :crypted_password,   default: nil
      t.string :salt,               default: nil
      t.string :remember_me_token,  default: nil
      t.datetime :remember_me_token_expires_at, default: nil
      t.timestamps
    end
    add_index :users, :remember_me_token
  end
end
