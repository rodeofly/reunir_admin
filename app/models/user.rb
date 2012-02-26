class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :role
  
  #validates_presence_of :name
  #validates_presence_of :role
  has_many :profils
  
  def role_enum
    %w[admin educateur]
  end

  def role?(role)
    self.role == role.to_s
  end
 
  def name
    user = ""
    user += !self.first_name.blank? ? self.first_name + " ": ""
    user += !self.last_name.blank? ? self.last_name : ""
  end
  
end
