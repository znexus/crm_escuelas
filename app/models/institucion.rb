class Institucion < ActiveRecord::Base
  
  has_many :addresses, :as => :addressable
  
  has_many :relacions
  has_many :personas, :through => :relacions
  has_many :listas, :as => :listable
  has_many :comentarios, :as => :comentable
  
  belongs_to :tipo_vinculo

  acts_as_taggable 

  validates_presence_of   :nombre, :tipo
  validates_uniqueness_of :nombre

  def to_s
    n = []
    n << tipo
    n << nombre
    n.join(": ")
  end
  
  TIPOS = [
    ["Agente de estudios", "Agencia Estudios"],
    ["Estatal", "Estado"],
    ["Salud", "Clinica"],
    ["Escolar", "Colegio"],
    ["Empresarial", "Empresa"],
    ["Universidad", "Universidad"],
    ["Agentes Educativos","Agente Educativo"]
  ]
  validates_inclusion_of :tipo, :in => 
    TIPOS.map {|disp, value| value}
end
