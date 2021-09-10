class AddStatusToComponents < ActiveRecord::Migration[5.2]
  def change
    add_column :components, :status, :boolean
  end
end
