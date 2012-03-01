# encoding: UTF-8
class Phone < ActiveRecord::Base
  belongs_to :phonable, :polymorphic => true
  validates_presence_of :phone_type
  validates_presence_of :number


  def phone_type_enum
    ['Personnel', 'Privé', 'Domicile', 'Bureau', 'Père', 'Mère', 'Enfant', 'Autre']
  end
  
  def name
    phone = ""
    phone += !self.phone_type.blank? ? self.phone_type + " : " : ""
    phone += !self.number.blank? ? self.number : ""
  end
  
  def pp
    phone_temp = ""
    phone_temp += !self.phone_type.blank? ?  self.phone_type + " : " : ""
    phone_temp += !self.number.blank? ?  self.number : ""
  end
end
