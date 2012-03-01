class GroupeParent < ActiveRecord::Base
  has_many :tuteurs  
  validates_uniqueness_of :name

  def nombre_de_tuteurs
    self.tuteurs.count
  end
end
