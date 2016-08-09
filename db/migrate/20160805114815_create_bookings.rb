class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :house_id
      t.integer :user_id

      t.timestamps
    end
    add_index :bookings, :user_id
    add_index :bookings, :house_id
    add_index :bookings, [:user_id, :house_id], unique: true
  end
end
