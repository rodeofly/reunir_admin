class GroupeEnfant < ActiveRecord::Base
  has_many :profils
  
  def nombre_de_profils
    self.profils.count
  end
end
