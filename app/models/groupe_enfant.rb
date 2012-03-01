class GroupeEnfant < ActiveRecord::Base
  has_many :profils
  validates_uniqueness_of :name

  def nombre_de_profils
    self.profils.count
  end
end
