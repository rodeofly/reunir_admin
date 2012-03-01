# encoding: UTF-8
class Tuteur < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :addresses
  has_many :phones, :as => :phonable, :dependent => :destroy
  accepts_nested_attributes_for :phones
  has_many :emails, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :emails
  has_many :comments, :as => :commentable, :dependent => :destroy
  accepts_nested_attributes_for :comments
  has_and_belongs_to_many :profils
  belongs_to :groupe_parent
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def tuteur_type_enum
    ['Père', 'Mère', 'Beau-Père', 'Belle-Mère', 'Oncle','Tante', 'Frère', 'Soeur', 'Cousin', 'Cousine', 'Autre']
  end
  
  def profession_enum
    ['agriculteur exploitant (secteur primaire)' ,'artisan, commerçant ou chef d\'entreprise' ,'cadre ou profession intellectuelle supérieure' ,'profession intermédiaire' ,'employé' ,'ouvrier' ,'retraité' ,'sans activité professionnelle' ]
  end
  
  def name
    tuteur = ""
    tuteur += !self.tuteur_type.blank? ? self.tuteur_type + " : " : ""
    tuteur += !self.first_name.blank? ? self.first_name + " ": ""
    tuteur += !self.last_name.blank? ? self.last_name : ""
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
