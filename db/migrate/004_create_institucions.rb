class CreateInstitucions < ActiveRecord::Migration
  def self.up
    create_table :institucions do |t|
      t.string :nombre
      t.string :ruc
      t.string :tipo
      t.timestamps
    end
    add_index :institucions, :nombre, :unique => true
    add_index :institucions, :ruc
  end

  def self.down
    drop_table :institucions
  end
end
