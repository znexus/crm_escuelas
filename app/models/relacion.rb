class Relacion < ActiveRecord::Base
  validates_presence_of :institucion_id, :persona_id
  validates_email_veracity_of :email, :allow_blank=>true  
  belongs_to :tipo_vinculo
  belongs_to :institucion
  belongs_to :persona

  def to_s
    t = []
    t << self.tipo_vinculo.nombre unless self.tipo_vinculo_id.blank?
    t << self.nombre unless self.nombre.blank?
    t << self.year unless self.year.blank?
    t << self.gradoseccion unless self.gradoseccion.blank?
    t << self.email unless self.email.blank?
    t << self.telefono unless self.telefono.blank?
    t.join(' | ').strip
  end

end
