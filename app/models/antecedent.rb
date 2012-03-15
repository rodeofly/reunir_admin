# encoding: UTF-8
class Antecedent < ActiveRecord::Base
belongs_to :antecedentable, :polymorphic => true
    
  def antecedent_type_enum
    ['Diabète', 'Hyper choléstérol', 'Hypertension', 'Maladies cardiovascilulaire']
  end
  
  def parent_enum
    ['Père', 'Mère', 'Grands-parents']
  end
  
  def name
    email = ""
    email += !self.parent.blank? ? self.parent + " : " : ""
    email += !self.antecedent_type.blank? ? self.antecedent_type : ""
  end

end
