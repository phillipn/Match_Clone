class AddColumnsToUserInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :hair, :string
    add_column :user_infos, :eye, :string
    add_column :user_infos, :education, :string
    add_column :user_infos, :kids, :boolean
    add_column :user_infos, :date_kids, :boolean
    add_column :user_infos, :want_kids, :boolean
    add_column :user_infos, :politics, :string
    add_column :user_infos, :date_politics, :boolean
    add_column :user_infos, :smoke, :boolean
    add_column :user_infos, :date_smoke, :boolean
    add_column :user_infos, :tattoo, :boolean
    add_column :user_infos, :date_tattoo, :boolean
    add_column :user_infos, :religion, :string
    add_column :user_infos, :date_religion, :boolean
    add_column :user_infos, :pet, :boolean
    add_column :user_infos, :date_pet, :boolean
  end
end
