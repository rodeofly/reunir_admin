# encoding: UTF-8
class SeanceParent < ActiveRecord::Base
  belongs_to :groupe_parent, :inverse_of => :seance_parents
  validates_presence_of :date_of_seance
  has_and_belongs_to_many :tuteurs
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  accepts_nested_attributes_for :comments, :allow_destroy => true
  
  def theme_enum
    ['Éducation thérapeutique', 'Éveil sensoriel']
  end
  
  def name
    name = ""
    name += self.theme.blank? ? "" : self.theme + " : "
    name += self.date_of_seance.blank? ? "" : I18n.localize(self.date_of_seance, :format => :long)
  end
  
  def info_comments_pp
    info_all = []
    self.comments.each do |comment|      
      info_all << comment.pp
    end
    info_all.join("\n")
  end
end
