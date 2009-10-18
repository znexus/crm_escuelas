class TipoVinculo < ActiveRecord::Base
 
  validates_presence_of :nombre, :tipo
  
  has_many :relacions
  
  TIPOS = Institucion::TIPOS
  
  validates_inclusion_of :tipo, :in => 
    TIPOS.map {|disp, value| value}

  def to_s
    "#{tipo}: #{nombre}"
  end

end
