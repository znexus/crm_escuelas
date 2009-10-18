class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :nombre
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
    user = User.new
    user.nombre = "Cristian Castillo"
    user.email = "ccastillo@znexus.net"
    user.password = "lima1234"
    user.save
  end

  def self.down
    drop_table :users
  end
end
