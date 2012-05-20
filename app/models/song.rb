class Song < ActiveRecord::Base
  attr_accessible :level, :notes, :title, :ver
  
  has_many :records
end
