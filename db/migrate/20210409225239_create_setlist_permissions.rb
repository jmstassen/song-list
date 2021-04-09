class CreateSetlistPermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :setlist_permissions do |t|
      t.integer :permission

      t.timestamps
    end
  end
end
