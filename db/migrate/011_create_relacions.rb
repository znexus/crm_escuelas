class CreateRelacions < ActiveRecord::Migration
  def self.up
    create_table :relacions do |t|
      t.integer :persona_id
      t.integer :institucion_id
      t.integer :tipo_vinculo_id
      t.string :nombre
      t.integer :year
      t.string :gradoseccion
      t.string :email
      t.string :telefono

      t.timestamps
    end

    add_index :relacions, :persona_id
    add_index :relacions, :institucion_id
    add_index :relacions, :tipo_vinculo_id
    execute "ALTER TABLE relacions ADD CONSTRAINT fk_persona FOREIGN KEY
    (persona_id) REFERENCES personas(id);"
    execute "ALTER TABLE relacions ADD CONSTRAINT fk_institucion FOREIGN KEY
    (institucion_id) REFERENCES institucions(id);"
    execute "ALTER TABLE relacions ADD CONSTRAINT fk_tipo FOREIGN KEY
    (tipo_vinculo_id) REFERENCES tipo_vinculos(id);"    
  end

  def self.down
    drop_table :relacions
  end
end
