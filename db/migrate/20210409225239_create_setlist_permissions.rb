class CreateSetlistPermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :setlist_permissions do |t|
      t.integer :permission
      t.references :user, foreign_key: true
      t.references :setlist, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
