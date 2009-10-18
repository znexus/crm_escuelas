class Plantilla < ActiveRecord::Base
  validates_presence_of :texto
  validates_presence_of :nombre
  has_many :adjuntos, :as => :adjuntable
end
