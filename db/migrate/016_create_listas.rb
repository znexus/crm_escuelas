class CreateListas < ActiveRecord::Migration
  def self.up
    create_table :listas do |t|
      t.integer :user_id
      t.string :listable_type
      t.integer :listable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :listas
  end
end
