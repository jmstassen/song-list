class CreateSetlists < ActiveRecord::Migration[6.1]
  def change
    create_table :setlists do |t|
      t.string :title
      t.string :location
      t.date :date
      t.boolean :public

      t.timestamps
    end
  end
end
