class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.time :C_in
      t.time :C_out
      t.integer :Guests
      t.integer :Amount

      t.timestamps
    end
  end
end
