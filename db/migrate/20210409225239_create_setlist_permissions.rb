class CreateSetlistPermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :setlist_permissions do |t|
      t.integer :permission
      t.referemces :user
      t.references :setlist
      
      t.timestamps
    end
  end
end
