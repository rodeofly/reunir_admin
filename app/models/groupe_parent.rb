class GroupeParent < ActiveRecord::Base
  has_many :seance_parents, :inverse_of => :groupe_parent
  has_many :tuteurs, :inverse_of => :groupe_parent
  
  validates_uniqueness_of :name
  
  def nombre_de_tuteurs
    self.tuteurs.count
  end
end
