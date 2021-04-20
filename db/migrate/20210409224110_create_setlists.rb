class CreateSetlists < ActiveRecord::Migration[6.1]
  def change
    create_table :setlists do |t|
      t.string :title
      t.string :location
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
