class Linebb < ActiveRecord::Base
  attr_accessible :author, :text
  
  validates :author, :length => { :maximum => 8 }
  validates :text, :presence => true, :length => { :maximum => 128 }
end
