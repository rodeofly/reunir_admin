# encoding: UTF-8
class Medecin < ActiveRecord::Base
  has_and_belongs_to_many :profils
  
  has_many :emails, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :emails
  
  has_many :phones, :as => :phonable, :dependent => :destroy
  accepts_nested_attributes_for :phones
   
  has_many :addresses, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :addresses
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  accepts_nested_attributes_for :comments
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  
  def specialty_enum
    ['Médecin généraliste', 'Pédiatre', 'Endocrinologue', 'Psychiatre', 'Psychologue']
  end
  
  def name
    user = ""
    user += !self.first_name.blank? ? "Dr. " + self.first_name + " ": ""
    user += !self.last_name.blank? ? self.last_name : ""
  end

  def org_member
    self.organization_member ? "Oui !" : "Non !"
  end
  
  def profils_count
    self.profils.count
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
