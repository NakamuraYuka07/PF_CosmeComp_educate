class CreateComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      
      t.integer :comp_category_id, null: false
      t.string :name, null: false
      t.text :explanation, null: false

      t.timestamps
    end
  end
end
