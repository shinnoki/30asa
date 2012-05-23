#coding: utf-8
class Record < ActiveRecord::Base
  attr_accessible :score, :song_id, :user_id
  
  belongs_to :user
  belongs_to :song
  
  validates_presence_of :user_id, :song_id, :score
  validates_numericality_of :score
  validate :score_valid?
  
  def score_valid?
    song = Song.find(song_id)
    if score.blank?
      #errors.add(:score, 'が空欄です')
    elsif score < 0
      errors.add(:score, 'がマイナスです')
    elsif score > song.notes*2
      errors.add(:score, 'が大きすぎます')
    end
  end
end
