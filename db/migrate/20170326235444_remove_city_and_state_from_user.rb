class RemoveCityAndStateFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :city
    remove_column :locations, :state
  end
end
