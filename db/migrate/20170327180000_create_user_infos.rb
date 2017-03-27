class CreateUserInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :user_infos do |t|
      t.integer :min_age
      t.integer :max_age
      t.boolean :have_kids
      t.boolean :want_kids
      t.integer :height
      t.boolean :smoke
      t.boolean :cat
      t.boolean :dog

      t.timestamps
    end
  end
end
