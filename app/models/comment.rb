# encoding: UTF-8
class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  
  def comment_type_enum
    [
      'Activité artistique',
      'Orienté vers Réunir par',
      'Habitudes alimentaires',
      'Divers',
      'Comportement psychologique',
      'Obésité => Facteurs déclenchant',
      'Obésité => Prise en charge antérieure',
      'Divers',
      'Thème abordé'
    ]
  end
  
  def name
    comment = ""
    comment += self.comment_type.blank? ? "" : self.comment_type + " : "
    comment += self.comment.blank? ? "" : self.comment
  end
end
