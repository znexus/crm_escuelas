class Titulo < ActiveRecord::Base
  validates_presence_of :nombre
  validates_uniqueness_of :nombre
  has_many :personas
  def to_s
    nombre
  end
end
