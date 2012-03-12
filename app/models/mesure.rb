# encoding: UTF-8
class Mesure < ActiveRecord::Base
  belongs_to :mesurable, :polymorphic => true
  validates_presence_of :date_of_mesure
  
  def degre_obesite_enum
    ['normale', 'surpoids', 'obésité', 'obésité sévère', 'obésité morbide']
  end

  def imc
    !self.poids.blank? && !self.taille.blank? ? (self.poids / (self.taille * self.taille / 10000)).round(2) : ""
  end
  
  def pp
    info_temp = ""
    info_temp += !self.date_of_mesure.blank? ? "Date du relevé : " +  I18n.localize(self.date_of_mesure,:format => :long) + "\n" : ""
    info_temp += !self.poids.blank? ? "Poids : " + self.poids.to_s + " Kg\n" : ""
    info_temp += !self.taille.blank? ? "Taille : " + self.taille.to_s + " cm\n" : ""
    info_temp += !self.tour_de_taille.blank? ? "Tour de taille : " + self.tour_de_taille.to_s + " cm\n" : ""
    info_temp += !self.tour_de_hanches.blank? ? "Tour de hanches : " + self.tour_de_hanches.to_s + " cm\n" : ""
    info_temp += !self.z_score.blank? ? "Z Score : " + self.z_score.to_s + "\n" : ""
    info_temp += !self.imc.blank? ? "IMC : " + self.imc.to_s + " Kg/m²\n" : "\n"
    info_temp += !self.degre_obesite.blank? ? "Degré d'obésité : " + self.degre_obesite.to_s + "\n" : ""
  end
end
