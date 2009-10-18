class Comentario < ActiveRecord::Base
  belongs_to :user
  belongs_to :comentable,
             :polymorphic => true
  acts_as_taggable
  
  validates_presence_of :texto

  TIPOS = [
    "Comentario",
    "Llamada",
    "Cita",
    "Reunión",
    "Email",
    "Venta cerrada",
    "Otro"
  ]
  validates_inclusion_of :tipo, :in => TIPOS

  MONEDAS = [
    [1, "Libras esterlinas", "LIB £"],
    [2, "Euros", "EU €"],
    [3, "Francos suizos", "SUIZ ₣"],
    [4, "Dolares canadiense", "CAN $"],
    [5, "Dolares americanos", "US $"],
    [5, "Soles", "S/."],
    [6, "Otra moneda", "¤"]
  ]

  def self.per_page
    5 
  end
  
  def to_s
    [self.created_at,self.user,self.tipo,self.texto].join(" | ")
  end

end
