# encoding: UTF-8
class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  belongs_to :zip
  validates_presence_of :zip
  
  def state_enum
    %w[Réunion France]
  end
  
  def cp
    self.zip.zipcode
  end

  def ville
    self.zip.city
  end
  
  def name
    "Adresse Postale"
  end
  
  def content
    self.line1 + "/" + self.line2 + "/" + self.cp + " - " + self.ville + " - " + self.state 
  end
  
end
