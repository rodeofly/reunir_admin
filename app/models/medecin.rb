# encoding: UTF-8
class Medecin < ActiveRecord::Base
  has_many :profils
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  
  has_one :email, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :email
  
  has_one :phone, :as => :phonable, :dependent => :destroy
  accepts_nested_attributes_for :phone
   
  has_one :address, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :address
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  accepts_nested_attributes_for :comments
  
  def specialty_enum
    ['généraliste', 'pédiatre', 'endocrinologue']
  end
  
  def name
    user = ""
    user += !self.first_name.blank? ? "Dr. " + self.first_name + " ": ""
    user += !self.last_name.blank? ? self.last_name : ""
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
