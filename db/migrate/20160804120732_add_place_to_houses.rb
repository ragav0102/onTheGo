class AddPlaceToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :place, :string
  end
end
