class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :songwriter
      t.string :tempo
      t.string :key
      t.text :note
      t.string :link

      t.timestamps
    end
  end
end
