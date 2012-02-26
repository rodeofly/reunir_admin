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
  
end
