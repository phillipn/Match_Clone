class AddFieldsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :match_room, index: true
    add_foreign_key :messages, :match_rooms
    remove_column :messages, :receiver_id
  end
end
