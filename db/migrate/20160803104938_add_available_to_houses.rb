class AddAvailableToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :availability, :boolean, default: true
  end
end
