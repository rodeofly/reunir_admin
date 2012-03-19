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
    user = "Dr. "
    user += !self.first_name.blank? ? self.first_name + " ": ""
    user += !self.last_name.blank? ? self.last_name : ""
    user += !self.specialty.blank? ? " (" + self.specialty + ")": ""
  end

  def org_member
    self.organization_member ? "Oui !" : "Non !"
  end
  
  def profils_count
    self.profils.count
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
