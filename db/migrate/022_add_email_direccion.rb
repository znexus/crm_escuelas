class AddEmailDireccion < ActiveRecord::Migration
  def self.up
    add_column :addresses, :email1, :string
    add_column :addresses, :email2, :string
  end

  def self.down
    remove_column :addresses, :email1
    remove_column :addresses, :email2
  end
  
end
