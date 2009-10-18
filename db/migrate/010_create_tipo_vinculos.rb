class CreateTipoVinculos < ActiveRecord::Migration
  def self.up
    create_table :tipo_vinculos do |t|
      t.string :nombre
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_vinculos
  end
end
