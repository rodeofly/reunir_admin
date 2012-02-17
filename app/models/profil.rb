class Profil < ActiveRecord::Base
  has_paper_trail
  has_many :questionnaires
  validates_presence_of :name
  validates_presence_of :user
  belongs_to :medecin
  belongs_to :user
  belongs_to :groupe_enfant
  belongs_to :groupe_parent
    
    
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address
    
  def ajouter_un_questionnaire
    return "-"
  end
  
  def nombre_de_questionnaires
    self.questionnaires.count
  end
end
