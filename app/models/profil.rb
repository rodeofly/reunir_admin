# encoding: UTF-8
class Profil < ActiveRecord::Base  
  has_and_belongs_to_many :seance_enfants

  has_paper_trail
  
  has_and_belongs_to_many :medecins
  has_and_belongs_to_many :tuteurs
  has_many :profil_mesures, :inverse_of => :profil
  
  belongs_to :school, :inverse_of => :profils
  belongs_to :user, :inverse_of => :profils
  belongs_to :groupe_enfant, :inverse_of => :profils

  has_many :questionnaires, :dependent => :destroy
  
  has_many :addresses, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :addresses, :allow_destroy => true
  
  has_many :phones, :as => :phonable, :dependent => :destroy
  accepts_nested_attributes_for :phones, :allow_destroy => true
  
  has_many :emails, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :emails, :allow_destroy => true

  has_many :comments, :as => :commentable, :dependent => :destroy
  accepts_nested_attributes_for :comments, :allow_destroy => true
  
  has_many :bilan_sanguins, :as => :bilanable, :dependent => :destroy
  accepts_nested_attributes_for :bilan_sanguins, :allow_destroy => true
  
  has_many :objectifs, :as => :objectivable, :dependent => :destroy
  accepts_nested_attributes_for :objectifs, :allow_destroy => true
  
  has_many :diagnostics, :as => :diagnosticable, :dependent => :destroy
  accepts_nested_attributes_for :diagnostics, :allow_destroy => true
  
  has_many :antecedents, :as => :antecedentable, :dependent => :destroy
  accepts_nested_attributes_for :antecedents, :allow_destroy => true
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def classroom_enum
    ['Petite Section', 'Moyenne Section', 'Grande Section', 'CP', 'CE1', 'CE2', 'CM1', 'CM2', '6ème', '5ème', '4ème', '3ème', '2nde', '1ère', 'Terminale']
  end
  
  def situation_maritale_des_parents_enum
    ['Mariés', 'Pacsé', 'En concubinage', 'Séparé', 'Isolé', 'Veuf', 'Famille recomposée']
  end
  
  def type_de_logement_enum
    ['Appartement', 'Maison']
  end
  
  def gender_enum
    ['Masculin', 'Féminin']
  end
  
  def degre_obesite_enum
    ['Normale', 'Surpoid', 'Obésité', 'Obésité morbide']
  end
  
  def corticoide_enum
    ['jamais', '- de 1 mois', '- de 3 mois', '- de 1 an', '+ de 1 an']
  end
  def antihistaminique_enum
    ['jamais', '- de 1 mois', '- de 3 mois', '- de 1 an', '+ de 1 an']
  end
  def antiepileptique_enum
    ['jamais', '- de 1 mois', '- de 3 mois', '- de 1 an', '+ de 1 an']
  end 
  def name
    profil = ""
    profil += !self.first_name.blank? ? self.first_name + " ": ""
    profil += !self.last_name.blank? ? self.last_name : ""
  end
  
  def age
    now = Time.now.utc.to_date
    now.year - self.birthdate.year - ((now.month > self.birthdate.month || (now.month == self.birthdate.month && now.day >= self.birthdate.day)) ? 0 : 1)
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
  
  def diagnostics_array
    array = []
    self.diagnostics.each do |diagnostic|
      transaction = []
      diagnostic.attributes.each do |item|
        transaction << item ? item.name : item.name
      end
      array << transaction
    end
  end
  
  def info_diagnostics_pp
    info_all = []
    self.diagnostics.each do |diagnostic|
      info_temp = ""
      info_temp += !diagnostic.diagnostic_type.blank? ? diagnostic.diagnostic_type + "\n" : ""
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
  
  def info_foyer_pp
    info_temp = ""
    info_temp += !self.situation_maritale_des_parents.blank? ? "Situation des parents : " + self.situation_maritale_des_parents + "\n" : ""
    info_temp += !self.fratrie.blank? ? self.fratrie.to_s + " frère(s) et soeur(s)\n" : ""
    info_temp += !self.rang_dans_la_fratrie.blank? ? "Rang dans la fratrie : " + self.rang_dans_la_fratrie.to_s + "\n" : ""
    info_temp += !self.fratrie_en_surpoids.blank? ? "Frère et soeur en surpoids : " + self.fratrie_en_surpoids.to_s + "\n" : ""
    info_temp += !self.habitant_du_foyer.blank? ? "Foyer composé de " + self.habitant_du_foyer.to_s + " personnes\n" : ""
    info_temp += !self.type_de_logement.blank? ? "Logement : " + self.type_de_logement + "\n" : ""
    info_temp += !self.television.blank? ? !self.television ? "Pas de télévision : " : self.television.to_s + " télévision(s)\n" : ""
    info_temp += !self.ordinateur.blank? ? !self.ordinateur ? "Pas d'ordinateur : " : self.ordinateur.to_s + " ordinateur(s)\n" : ""
    info_temp += !self.parabole ? "" : "Présence d'une parabole\n"
    info_temp += !self.internet ? "" : "Connecté à internet\n"
    
  end
  
  def info_mesures_pp
    info_all = []
    self.profil_mesures.each do |mesure|
      info_all << mesure.pp
    end
    info_all.join("\n")
  end
  
  def info_addresses_pp
    addresses = []
    self.addresses.each do |address|
      addresses << address.pp
    end
    addresses.join("\n")
  end
  
  def info_comments_pp
    info_all = []
    self.comments.each do |comment|      
      info_all << comment.pp
    end
    info_all.join("\n")
  end
  
  def info_phones_pp
    phones_list = []
    self.phones.each do |phone|
      phones_list << phone.pp
    end
    phones_list.join("\n")
  end
  
  def info_emails_pp
    emails_list = []
    self.emails.each do |email|
      emails_list << email.pp
    end
    emails_list.join("\n")
  end
  
  
end
