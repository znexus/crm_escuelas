class CreatePersonas < ActiveRecord::Migration
  def self.up
    create_table :personas do |t|
      t.string :nombre
      t.string :apepat
      t.string :apemat
      t.integer :familia_id
      t.integer :titulo_id
      t.string :sexo
      t.date :nacimiento
      t.string :email

      t.timestamps
    end
    add_index :personas, :nombre
    add_index :personas, :apepat
    add_index :personas, :apemat
    add_index :personas, [:nombre, :apepat, :apemat], :unique => true
    add_index :personas, :familia_id
    add_index :personas, :titulo_id
    execute "ALTER TABLE personas ADD CONSTRAINT titulo_id_fkey FOREIGN KEY
    (titulo_id) REFERENCES titulos (id);"
  end

  def self.down
    drop_table :personas
  end
end
