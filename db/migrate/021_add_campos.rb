class AddCampos < ActiveRecord::Migration
  def self.up
    add_column :personas, :etiquetas, :boolean
    add_column :personas, :asistcard, :boolean
  end

  def self.down
    remove_column :personas, :etiquetas
    remove_column :personas, :asistcard
  end
  
end

