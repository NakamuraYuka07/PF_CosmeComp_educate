class ChangeDataSkinTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :skin_type, :integer, defalut: 0
  end
end
