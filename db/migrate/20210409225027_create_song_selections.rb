class CreateSongSelections < ActiveRecord::Migration[6.1]
  def change
    create_table :song_selections do |t|
      t.integer :song_number
      t.references :song, foreign_key: true
      t.references :setlist, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
