class Category < ActiveRecord::Base
  has_many :questionnaires
  
  def nombre_de_questionnaires
    self.questionnaires.count
  end
end
