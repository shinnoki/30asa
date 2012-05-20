class Record < ActiveRecord::Base
  attr_accessible :score, :song_id, :user_id
  
  belongs_to :user
  belongs_to :song
end
