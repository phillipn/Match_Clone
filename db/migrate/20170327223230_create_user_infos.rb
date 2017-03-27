class CreateUserInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_infos do |t|
      t.references :user, foreign_key: true
      t.string :personality
      t.integer :max_age
      t.integer :min_age

      t.timestamps
    end
  end
end
