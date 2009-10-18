class AddCamposComentarios < ActiveRecord::Migration
  def self.up
    add_column :comentarios, :monto, :decimal, :precision => 8, :scale => 2
    add_column :comentarios, :moneda, :string
    add_column :comentarios, :fecha_inicio, :date
    add_column :comentarios, :fecha_fin, :date
  end

  def self.down
    remove_column :comentarios, :monto
    remove_column :comentarios, :moneda
    remove_column :comentarios, :fecha_inicio
    remove_column :comentarios, :fecha_fin

  end
  
end
