class Familia < ActiveRecord::Base
  belongs_to :padre, :class_name => "Persona", :foreign_key => :padre_id
  belongs_to :madre, :class_name => "Persona", :foreign_key => :madre_id

  has_many :addresses, :as => :addressable
  has_many :personas
  has_many :comentarios, :as => :comentable
  has_many :listas, :as => :listable
  
  #validates_uniqueness_of familia
  validate :familia_unica?
  validate :tiene_algun_padre?
  acts_as_taggable
  
  def to_s
    nombre
  end
  
  #nombre de la familia, los nombres de los padres
  def nombre
    m = []
    m << self.padre.nombre unless self.padre.blank?
    m << self.madre.nombre unless self.madre.blank?
    m = m.join('&')
    n = []
    n << self.padre.apepat unless self.padre.blank? 
    n << self.madre.apepat unless self.madre.blank?
    n << "(#{m})"
    n.join(' ')
  end
  
  def familia_unica?
    if self.new_record?
      familias = Familia.find(:all, 
                      :conditions => ["padre_id = ? and madre_id = ?",
                                      self.padre_id, self.madre_id] )
    else
      familias = Familia.find(:all, 
                      :conditions => ["padre_id = ? and madre_id = ? and id <> ?",
                                      self.padre_id, self.madre_id, self.id] )      
    end

    if familias.size > 0
      errors.add_to_base("Esta familia ya existe.")
    end

  end

  def tiene_algun_padre?
    if self.madre.blank? and self.padre.blank?
      errors.add_to_base("Debe ingresar al menos un padre o madre")      
    end
  end

  def direcciones
    d = self.addresses
    d += self.madre.addresses unless(self.madre.blank? || self.madre.addresses.blank?)
    d += self.padre.addresses unless(self.padre.blank? || self.padre.addresses.blank?)
    self.personas.each do |p|
      d += p.addresses
    end
    d
  end
  
  def email
    d = []
    d << padre.email if padre.email?
    d << madre.email if madre.email?
    d.join(",")
  end

end
