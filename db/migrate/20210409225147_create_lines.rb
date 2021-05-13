class CreateLines < ActiveRecord::Migration[6.1]
  def change
    create_table :lines do |t|
      t.text :lyrics
      t.string :chords
      t.integer :line_number
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
