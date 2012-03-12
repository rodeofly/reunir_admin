# encoding: UTF-8
class School < ActiveRecord::Base
  belongs_to :zip
  has_many :profils, :inverse_of => :school
  validates_presence_of :schooltype
  validates_presence_of :name
  validates_presence_of :zip
  
  def schooltype_enum
    ['École Primaire', 'École Élémentaire', 'Collège', 'Lycée', 'Lycée Professionnel']
  end
  
  def name
    if !(self.schooltype.blank?)
          self.schooltype + " " + read_attribute(:name) + " - " + self.zip.name
    end
  end
end
