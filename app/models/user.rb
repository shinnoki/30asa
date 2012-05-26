class User < ActiveRecord::Base
  attr_accessible :name
  
  has_many :records, :dependent => :destroy
  
  
  
  # Devise settings
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable,
         :authentication_keys => [ :account ]
  attr_accessible :account, :email, :username, :password, :password_confirmation, :remember_me
  
  validates :name, 
    :presence => true, 
    :length => { :maximum => 6 },
    :format => { :with => /^[-0-9A-Z_@#\!\?\*\$\.]*$/ }
  validates :account,
    :presence => true,
    :uniqueness => true,
    :length => { :maximum => 20 },
    :format => { :with => /^[0-9A-Za-z_]*$/ }
  
  
  
  def email_required?
    false
  end
end
