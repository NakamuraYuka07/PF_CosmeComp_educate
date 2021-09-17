class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      
      t.integer :comment_id, null: false
      t.integer :item_category_id, null: false
      t.integer :favorite_id, null: false
      t.string :name, null: false
      t.string :item_image_id, null: false
      t.text :explanation, null: false
      t.text :component, null: false
      t.boolean :status, default: false, null: false


      t.timestamps
    end
  end
end
