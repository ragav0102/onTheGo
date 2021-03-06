class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :balance

      t.timestamps
    end
    add_index :users, [:email, :phone]

  end
end
