class AddBirthdayToUserInfos < ActiveRecord::Migration[5.0]
  def change
    add_column :user_infos, :birthday, :date
  end
end
