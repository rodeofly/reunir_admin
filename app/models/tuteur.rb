# encoding: UTF-8
class Tuteur < ActiveRecord::Base
  has_and_belongs_to_many :seance_parents
  has_and_belongs_to_many :profils

  belongs_to :groupe_parent, :inverse_of => :tuteurs
  
  has_many :tuteur_mesures, :inverse_of => :tuteur
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  accepts_nested_attributes_for :comments

  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def tuteur_type_enum
    ['Père', 'Mère', 'Beau-Père', 'Belle-Mère', 'Oncle','Tante', 'Frère', 'Soeur', 'Cousin', 'Cousine', 'Autre']
  end
  
  def profession_enum
    ['agriculteur exploitant (secteur primaire)' ,'artisan, commerçant ou chef d\'entreprise' ,'cadre ou profession intellectuelle supérieure' ,'profession intermédiaire' ,'employé' ,'ouvrier' ,'retraité' ,'sans activité professionnelle' ]
  end
  
  def name
    "#{!self.first_name.blank? ? self.first_name : ""} #{!self.last_name.blank? ? self.last_name : ""}(#{!self.tuteur_type.blank? ? self.tuteur_type : ""})"
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
  
  def info_mesures_pp
    info_all = []
    self.tuteur_mesures.each do |mesure|
      info_all << mesure.pp
    end
    info_all.join("\n")
  end
end
