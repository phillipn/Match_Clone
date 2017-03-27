class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :sender
      t.references :receiver
      t.string :status

      t.timestamps
    end
  end
end
