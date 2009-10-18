class CreatePlantillas < ActiveRecord::Migration
  def self.up
    create_table :plantillas do |t|
      t.string :nombre
      t.text :texto

      t.timestamps
    end
  end

  def self.down
    drop_table :plantillas
  end
end
