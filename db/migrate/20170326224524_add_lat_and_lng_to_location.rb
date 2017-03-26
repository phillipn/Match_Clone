class AddLatAndLngToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :lng, :float
    add_column :locations, :lat, :float
  end
end
