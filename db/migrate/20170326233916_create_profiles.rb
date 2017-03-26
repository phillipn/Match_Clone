class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.text :about_me
      t.text :ideal_mate
      t.text :job
      t.text :religion
      t.text :hobbies

      t.timestamps
    end
  end
end
