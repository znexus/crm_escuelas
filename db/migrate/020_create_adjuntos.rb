class CreateAdjuntos < ActiveRecord::Migration
  
  def self.up
    create_table :adjuntos do |t|
      t.column :adjuntable_type, :string
      t.column :adjuntable_id, :integer
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
    end
  end

  def self.down
    drop_table :adjuntos
  end
end
