class CreateSongSelections < ActiveRecord::Migration[6.1]
  def change
    create_table :song_selections do |t|
      t.integer :song_order
      t.references :song
      t.references :setlist

      t.timestamps
    end
  end
end
