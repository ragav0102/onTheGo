class AddNameToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :name, :string
  end
end
