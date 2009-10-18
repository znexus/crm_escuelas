class AddEnviadoColumnLista < ActiveRecord::Migration
  def self.up
    add_column :listas, :enviado, :boolean, :default=>false
  end

  def self.down
    remove_column :listas, :enviado
  end
end
