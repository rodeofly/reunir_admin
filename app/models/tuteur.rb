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
  
  def emails_pp
    emails_list = []
    self.emails.each do |email|
      email_temp = ""
      email_temp += !email.email_type.blank? ?  email.email_type + " : " : ""
      email_temp += !email.number.blank? ?  email.number : ""
      emails_list << email_temp
    end
    emails_list.join("\n")
  end
end
