# encoding: UTF-8
class Email < ActiveRecord::Base
  belongs_to :emailable, :polymorphic => true
  validates_uniqueness_of :email
    
  def email_type_enum
    ['Personnel', 'Privé', 'Domicile', 'Bureau', 'Père', 'Mère', 'Enfant', 'Autre']
  end
  
  def name
    email = ""
    email += !self.email_type.blank? ? self.email_type + " : " : ""
    email += !self.email.blank? ? self.email : ""
  end
end
