class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,         null: false
      t.string :email,            default: nil
      t.string :crypted_password, default: nil
      t.string :salt,             default: nil
      t.timestamps
    end
  end
end
