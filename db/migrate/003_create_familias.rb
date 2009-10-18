class CreateFamilias < ActiveRecord::Migration
  def self.up
    create_table :familias do |t|
      t.integer :padre_id
      t.integer :madre_id
      t.timestamps
    end
    add_index :familias, :padre_id
    add_index :familias, :madre_id
    execute "ALTER TABLE familias ADD CONSTRAINT fk_padre FOREIGN KEY
    (padre_id) REFERENCES personas(id);"
    execute "ALTER TABLE familias ADD CONSTRAINT fk_madre FOREIGN KEY
    (madre_id) REFERENCES personas(id);"
  end

  def self.down
    drop_table :familias
  end
end
