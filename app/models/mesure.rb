# encoding: UTF-8
class Mesure < ActiveRecord::Base
  belongs_to :mesurable, :polymorphic => true
  validates_presence_of :date_of_mesure
  
  def degre_obesite_enum
    ['normale', 'surpoids', 'obésité', 'obésité sévère', 'obésité morbide']
  end

  def imc
    !self.poids.blank? && !self.taille.blank? ? (self.poids / (self.taille * self.taille)).round(2) : "inconnu"
  end
end
