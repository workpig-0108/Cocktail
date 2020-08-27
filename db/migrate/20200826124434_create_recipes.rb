class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :genre_id
      t.string :name
      t.text :discription
      t.string :image_id

      t.timestamps
    end
  end
end
