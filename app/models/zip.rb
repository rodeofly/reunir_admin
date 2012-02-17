class Zip < ActiveRecord::Base
  validates_presence_of :zipcode
  validates_presence_of :city
  
  def name
    !self.zipcode.blank? ? self.zipcode + " - " + self.city : ""
  end
end
