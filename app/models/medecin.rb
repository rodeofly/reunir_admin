# encoding: UTF-8
class Medecin < ActiveRecord::Base
  has_many :profils
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address
  validates_presence_of :name
  
  def specialty_enum
    %w[généraliste pédiatre endocrinologue]
  end
  
  def title
    "Dr. " + self.name
  end
  
  def org_member
    self.organization_member ? "Oui !" : "Non !"
  end
  
  def profils_count
    self.profils.count
  end
  
  
  
  def new
    @customer = Customer.new
    @customer.build_address
  end
end
