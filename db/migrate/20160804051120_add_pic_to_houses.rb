class AddPicToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :pic, :string
  end
end
