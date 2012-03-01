# encoding: UTF-8
class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  belongs_to :zip
    
  def address_type_enum
    ['Personnelle', 'Privée', 'Domicile', 'Bureau', 'Père', 'Mère', 'Enfant', 'Autre']
  end
  
  def country_enum
    %w[Réunion France]
  end
  
  def cp
    !self.zip.blank? ? self.zip.zipcode : ""
  end

  def ville
    !self.zip.blank? ? self.zip.city : ""  
  end
  
  def pp
    address_temp = ""
    address_temp += !self.address_type.blank? ?  self.address_type + " :\n" : ""
    address_temp += !self.line1.blank? ?  self.line1 + "\n" : ""
    address_temp += !self.line2.blank? ? self.line2 + "\n" : ""
    address_temp += !self.cp.blank? ? self.cp + " - " : ""
    address_temp += !self.ville.blank? ? self.ville + "\n" : ""
    address_temp += !self.country.blank? ? self.country + "\n" : ""
  end
  
end
