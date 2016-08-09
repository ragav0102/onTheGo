class DropProductsTable < ActiveRecord::Migration
  def up
    drop_table :bookings
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end