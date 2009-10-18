class CreateTitulos < ActiveRecord::Migration
  def self.up
    create_table :titulos do |t|
      t.string :nombre

      t.timestamps
    end
    #creo algunos valores por defecto
    titulos = [
      "Señor, Señora",
      "Doctor, Doctora",
      "Ingeniero, Ingeniera",
    ]
    titulos.each do |t|
      titulo = Titulo.new
      titulo.nombre = t
      titulo.save
    end
  end

  def self.down
    drop_table :titulos
  end
end
