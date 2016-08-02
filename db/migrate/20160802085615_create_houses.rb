class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :max_guests
      t.integer :Charge_day
      t.time :Ch_in
      t.time :Ch_out

      t.timestamps
    end
  end
end
