class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.integer :zombie_id
      t.string :weapon
      t.integer :damage

      t.timestamps
    end
    add_index :weapons, :zombie_id
  end
end
