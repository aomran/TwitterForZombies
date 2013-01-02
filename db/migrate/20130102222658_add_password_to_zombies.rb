class AddPasswordToZombies < ActiveRecord::Migration
  def up
    add_column :zombies, :password_digest, :string
  end

  def down
    remove_column :zombies, :password_digest
  end
end
