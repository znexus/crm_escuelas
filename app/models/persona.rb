class Persona < ActiveRecord::Base
  acts_as_taggable
 
  has_many :relacions
  
  has_many :institucions, :through => :relacions, :order => "created_at desc"
  has_many :comentarios, :as => :comentable
  has_many :addresses, :as => :addressable
  has_many :listas, :as => :listable
  
  belongs_to :titulo
  belongs_to :padre, :class_name => "Familia", :foreign_key => "padre_id"
  belongs_to :madre, :class_name => "Familia", :foreign_key => "madre_id"
  belongs_to :familia

  before_validation :_clean_whitespace
  
  
  SEXO_TYPES = [
    ["Masculino", "Masculino"],
    ["Femenino", "Femenino"]
  ]
  validates_inclusion_of :sexo, :in => 
    SEXO_TYPES.map {|disp, value| value}

  validates_presence_of :nombre, :sexo
  #validates_uniqueness_of nombre_completo

  validate :nombre_unico?
  
  validates_email_veracity_of :email, :allow_blank=>true

  validate :familia_o_apellidos?

  def to_s
    nombre_completo
  end

  def nombre_completo
    t = "";
    unless titulo_id.blank?
      t = titulo.nombre.split(',')
      if self.sexo == "Masculino"
        t = titulo[0]
      else
        t = titulo[1]
      end
    end
    todo = []
    todo << t
    todo << nombre
    todo << apepat if apepat
    todo << apemat if apemat
    todo << "/#{familia.to_s}" unless familia.blank?
    todo.join(' ').strip
  end

  #la dirección de una persona
  def direccion
    if self.addresses.size > 0
      self.addresses.first
    else
      if self.familia and self.familia.addresses.size >0
        self.familia.addresses.first
      else
        Address.new(:street_1=>"-sin dirección-")
      end
    end
  end
  
  protected
  
  def nombre_unico?
    if self.new_record?
      personas = Persona.find(:all, 
                      :conditions => ["nombre like ? and apepat like ? and apemat like ? and familia_id = ? ",
                                      self.nombre, self.apepat, self.apemat, self.familia_id] )
    else
      personas = Persona.find(:all, 
                      :conditions => ["nombre like ? and apepat like ? and apemat like ? and id <> ? and familia_id = ?",
                                      self.nombre, self.apepat, self.apemat, self.id, self.familia_id] )      
    end

    if personas.size > 0
      errors.add_to_base("Esta persona ya existe. 
        Si es un homónimo agrega al apellido (homónimo) 
        o algún mensaje entre paréntesis")
    end

  end
  
  #esto para saber si tiene apellidos o pertenece a algúna familia
  def familia_o_apellidos?
    if self.familia_id.blank?
      if self.apepat.blank?
        errors.add_to_base("Debe tener al menos apellido paterno, o pertener a alguna familia")
      end
    end
  end

  def _clean_whitespace
    self.attributes.each_pair do |key, value|
      RAILS_DEFAULT_LOGGER.debug("stripping #{key.to_s} with value #{value.to_s}")
      self[key] = value.strip if value.respond_to?('strip')
    end
  end
      
end
