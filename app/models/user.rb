class User < ActiveRecord::Base
  attr_accessible :name
  
  has_many :records, :dependent => :destroy
  
  validates :name, :presence => true, :length => { :maximum => 8 }
end
