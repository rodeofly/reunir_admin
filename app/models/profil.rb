# encoding: UTF-8
class Profil < ActiveRecord::Base
  has_paper_trail
  has_many :questionnaires, :dependent => :destroy
  belongs_to :school
  belongs_to :medecin
  belongs_to :user
  belongs_to :groupe_enfant
  has_many :addresses, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :addresses
  has_many :phones, :as => :phonable, :dependent => :destroy
  accepts_nested_attributes_for :phones
  has_many :emails, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :emails
  has_many :comments, :as => :commentable, :dependent => :destroy
  accepts_nested_attributes_for :comments
  has_and_belongs_to_many :tuteurs
  accepts_nested_attributes_for :tuteurs
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def classroom_enum
    ['Petite Section', 'Moyenne Section', 'Grande Section', 'CP', 'CE1', 'CE2', 'CM1', 'CM2', '6ème', '5ème', '4ème', '3ème', '2nde', '1ère', 'Terminale']
  end
  
  def gender_enum
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
      email_temp += !email.email.blank? ?  email.email : ""
      emails_list << email_temp
    end
    emails_list.join("\n")
  end
end
