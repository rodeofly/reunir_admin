# encoding: UTF-8
class Profil < ActiveRecord::Base  
  has_paper_trail
  
  has_and_belongs_to_many :medecins
  has_and_belongs_to_many :tuteurs
  
  belongs_to :school  
  belongs_to :user
  belongs_to :groupe_enfant

  has_many :questionnaires, :dependent => :destroy
  
  has_many :addresses, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :addresses, :allow_destroy => true
  
  has_many :phones, :as => :phonable, :dependent => :destroy
  accepts_nested_attributes_for :phones, :allow_destroy => true
  
  has_many :emails, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :emails, :allow_destroy => true

  has_many :comments, :as => :commentable, :dependent => :destroy
  accepts_nested_attributes_for :comments, :allow_destroy => true
  
  has_many :mesures, :as => :mesurable, :dependent => :destroy
  accepts_nested_attributes_for :mesures, :allow_destroy => true
  
  has_many :objectifs, :as => :objectivable, :dependent => :destroy
  accepts_nested_attributes_for :objectifs, :allow_destroy => true
  
  has_many :diagnostics, :as => :diagnosticable, :dependent => :destroy
  accepts_nested_attributes_for :diagnostics, :allow_destroy => true

  #has_many :etpis, :as => :etpiable, :dependent => :destroy
  #accepts_nested_attributes_for :etpis
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def classroom_enum
    ['Petite Section', 'Moyenne Section', 'Grande Section', 'CP', 'CE1', 'CE2', 'CM1', 'CM2', '6ème', '5ème', '4ème', '3ème', '2nde', '1ère', 'Terminale']
  end
  
  def gender_enum
    ['Masculin', 'Féminin']
  end
  
  def degre_obesite_enum
    ['Masculin', 'Féminin']
  end
    
  def name
    profil = ""
    profil += !self.first_name.blank? ? self.first_name + " ": ""
    profil += !self.last_name.blank? ? self.last_name : ""
  end
  
  def nombre_de_questionnaires
    self.questionnaires.count
  end
  
  def questionnaire_add
    "azerty"
  end
  
  def prematurite?
    self.terme_sa.blank? ? "" : self.terme_sa<37 ? "oui" : "non" 
  end
  
  def pma?
    self.pma.blank? ? "" : self.pma ? "oui" : "non"
  end
  
  def rciu?
    self.rciu.blank? ? "" : self.rciu ? "oui" : "non"
  end
  
  def allaitement?
    self.allaitement.blank? ? "" : self.allaitement ? "oui" : "non"
  end
  
  def diabete_gestationnel?
    self.diabete_gestationnel.blank? ? "" : self.diabete_gestationnel ? "oui" : "non"
  end
  
  def facteur_declenchant?
    self.facteur_declenchant.blank? ? "" : self.facteur_declenchant ? "oui" : "non"
  end
  
  def rebond_ponderal_precoce?
    self.rebond_ponderal_precoce.blank? ? "" : self.rebond_ponderal_precoce ? "oui" : "non"
  end
  
  def prise_en_charge_anterieure?
    self.prise_en_charge_anterieure.blank? ? "" : self.prise_en_charge_anterieure ? "oui" : "non"
  end
  
  def emails_pp
    emails_list = []
    self.emails.each do |email|
      email_temp = ""
      email_temp += !email.email_type.blank? ?  email.email_type + " : " : ""
      email_temp += !email.email.blank? ?  email.email : ""
      emails_list << email_temp
    end
    emails_list.join("\n")
  end
  
  def info_diagnostics_pp
    info_all = []
    self.diagnostics.each do |diagnostic|
      info_temp = ""
      info_temp += !diagnostic.date_du_diagnostic.blank? ? "Date : " + I18n.localize(diagnostic.date_du_diagnostic, :format => :long) + "\n" : ""
      info_temp += diagnostic.anomalie_activite_physique ? "Manque d'activités physiques\n" : ""
      info_temp += diagnostic.anomalie_temps_ecran ? "Excès de temps passé devant l'écran\n" : ""
      info_temp += diagnostic.anomalie_grignotage ? "Excès de grignotage\n" : ""
      info_temp += diagnostic.anomalie_consommation_soda ? "Excès de consommation de soda\n" : ""
      info_temp += diagnostic.anomalie_alimentation_trop_riche ? "Alimentation trop riche\n" : ""
      info_temp += diagnostic.anomalie_alimentation_fruits_legumes ? "Carence en fruits et légumes\n" : ""
      info_temp += diagnostic.anomalie_composition_repas ? "Composition des repas à revoir\n" : ""
      info_temp += diagnostic.anomalie_contexte_repas ? "Contexte des repas à revoir\n" : ""
      info_temp += diagnostic.anomalie_repartition_repas ? "Répartition des repas à revoir\n" : ""
      info_temp += !diagnostic.motivation_famille.blank? ? "Motivation de la famille : " + diagnostic.motivation_famille + "\n" : ""
      info_temp += !diagnostic.motivation_famille.blank? ? "Motivation de l'enfant : " + diagnostic.motivation_enfant + "\n" : ""
      info_temp += !diagnostic.date_du_prochain_diagnostic.blank? ? "Date du prochain rendez-vous : " + I18n.localize(diagnostic.date_du_prochain_diagnostic, :format => :long) + "\n" : ""
      info_all << info_temp      
    end
    info_all.join("\n")
  end
   
  def info_objectifs_pp
    pending_object = []
    reached_object = []
    info_all = []
    self.objectifs.each do |objectif|
      info_temp = ""
      info_temp += !objectif.objectif_type.blank? ? objectif.objectif_type + " : " : ""
      info_temp += !objectif.objectif.blank? ? objectif.objectif : ""
      if objectif.atteint then
        reached_object << info_temp
      else
        pending_object << info_temp
      end
    end
    if !reached_object.blank?
      info_all << "- Objectif atteint:"
      info_all << reached_object
    end
    if !pending_object.blank?
      info_all << "- Objectif en cours:"
      info_all << pending_object
    end
    info_all.join("\n")
  end
  
  def addresses_pp
    addresses = []
    self.addresses.each do |address|
      address_temp = ""
      address_temp += !address.address_type.blank? ?  address.address_type + " :\n" : ""
      address_temp += !address.line1.blank? ?  address.line1 + "\n" : ""
      address_temp += !address.line2.blank? ? address.line2 + "\n" : ""
      address_temp += !address.cp.blank? ? address.cp + " - " : ""
      address_temp += !address.ville.blank? ? address.ville + "\n" : ""
      address_temp += !address.country.blank? ? address.country + "\n" : ""
      addresses << address_temp
    end
    addresses.join("\n")
  end
  
  def info_comments_pp
    info_all = []
    self.comments.each do |comment|
      info_temp = ""
      info_temp += !comment.comment_type.blank? ? comment.comment_type + " : " : ""
      info_temp += !comment.comment.blank? ? comment.comment : ""
      info_all << info_temp
    end
    info_all.join("\n")
  end
  
  def info_mesures_pp
    info_all = []
    self.mesures.each do |mesure|
      info_temp = ""
      info_temp += !mesure.date_of_mesure.blank? ? "Date du relevé : " +  I18n.localize(mesure.date_of_mesure,:format => :long) + "\n" : ""
      info_temp += !mesure.poids.blank? ? "Poids : " + mesure.poids.to_s + " Kg\n" : ""
      info_temp += !mesure.taille.blank? ? "Taille : " + mesure.taille.to_s + " cm\n" : ""
      info_temp += !mesure.tour_de_taille.blank? ? "Tour de taille : " + mesure.tour_de_taille.to_s + " cm\n" : ""
      info_temp += !mesure.tour_de_hanches.blank? ? "Tour de hanches : " + mesure.tour_de_hanches.to_s + " cm\n" : ""
      info_temp += !mesure.z_score.blank? ? "Z Score : " + mesure.z_score.to_s + "\n" : ""
      info_temp += !mesure.imc.blank? ? "IMC : " + mesure.imc.to_s + " Kg/m²\n" : "\n"
      info_temp += !mesure.degre_obesite.blank? ? "Degré d'obésité : " + mesure.degre_obesite.to_s + "\n" : ""
      info_all << info_temp
    end
    info_all.join("\n")
  end
    
  def info_naissance_pp
    info_temp = ""
    info_temp += !self.taille_naissance.blank? ? "Taille de naissance : " + self.taille_naissance.to_s + " cm\n" : ""
    info_temp += !self.poids_naissance.blank? ? "Poids de naissance : " + self.poids_naissance.to_s + " Kg\n" : ""
    info_temp += !self.terme_sa.blank? ? "Terme : " + self.terme_sa.to_s + " semaines d\'aménorrhée\n" : ""
    info_temp += !self.terme_sa.blank? ? "Prematuré(e) : " + self.prematurite? + "\n" : ""
    info_temp += !self.rciu.blank? ? "Retard de croissance intra-uterin : " + self.rciu? + "\n" : ""
    info_temp += !self.pma.blank? ? "Procréation médicalement assistée : " + self.pma? + "\n" : ""
    info_temp += !self.diabete_gestationnel.blank? ? "Diabète gestationnel : " + self.diabete_gestationnel? + "\n" : ""
    info_temp += !self.allaitement.blank? ? "Allaitement : " + self.allaitement? + "\n" : ""
    info_temp += !self.duree_allaitement.blank? ? "Durée de l'allaitement : " + self.duree_allaitement.to_s + " mois\n" : ""
  end

  def info_obesite_pp
    info_temp = ""
    info_temp += !self.age_obesite.blank? ? "Age de début de l'obésité : " + self.age_obesite.to_s + " ans\n" : ""
    info_temp += !self.rebond_ponderal_precoce.blank? ? "Rebond pondéral précoce : " + self.rebond_ponderal_precoce? + "\n" : ""
    info_temp += !self.facteur_declenchant.blank? ? "Facteur déclenchant : " + self.facteur_declenchant? + "\n" : ""
    info_temp += !self.prise_en_charge_anterieure.blank? ? "Prise en charge antérieure : " + self.prise_en_charge_anterieure? + "\n" : ""
  end
  
  
  
  def phones_pp
    phones_list = []
    self.phones.each do |phone|
      phone_temp = ""
      phone_temp += !phone.phone_type.blank? ?  phone.phone_type + " : " : ""
      phone_temp += !phone.number.blank? ?  phone.number : ""
      phones_list << phone_temp
    end
    phones_list.join("\n")
  end
  
  
end
