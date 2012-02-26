class Zip < ActiveRecord::Base
  validates_presence_of :city
  validates_presence_of :zipcode
  validates_uniqueness_of :zipcode
  
  def name
    if !self.zipcode.blank? && !self.city.blank?
      self.zipcode + " - " + self.city
    end
  end
end
