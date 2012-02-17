class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role
  
  #validates_presence_of :name
  #validates_presence_of :role
  has_many :profils
  
  def role_enum
    %w[admin educateur]
  end

 def role?(role)
   self.role == role.to_s
 end
  
end
