class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  
  def comment_type_enum
    ['Commentaire','Comportement','Autre']
  end
end
