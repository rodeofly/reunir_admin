# encoding: UTF-8
class Diagnostic < ActiveRecord::Base
  belongs_to :diagnosticable, :polymorphic => true
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  accepts_nested_attributes_for :comments, :allow_destroy => true
   

  def diagnostic_type_enum
    ['Diagnostic intermédiaire', 'Diagnostic annuel']
  end
  
  def motivation_famille_enum
    ['excellente', 'bonne', 'moyenne', 'insuffisante']
  end
  
  def motivation_enfant_enum
    ['excellente', 'bonne', 'moyenne', 'insuffisante']
  end
end
