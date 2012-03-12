class GroupeEnfant < ActiveRecord::Base
  has_many :seance_enfants, :inverse_of => :groupe_enfant
  has_many :profils, :inverse_of => :groupe_enfant
  
  validates_uniqueness_of :name

  def nombre_de_profils
    self.profils.count
  end
end
