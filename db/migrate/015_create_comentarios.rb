class CreateComentarios < ActiveRecord::Migration
  
  def self.up
    create_table :comentarios do |t|
      t.text :texto
      t.integer :comentable_id
      t.string :comentable_type
      t.datetime :recordatorio
      t.string :tipo
      t.references :user

      t.timestamps
    end
    add_index :comentarios, [:comentable_type, :comentable_id]
    add_index :comentarios, :user_id
  end

  def self.down
    drop_table :comentarios
  end
  
end
