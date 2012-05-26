class RankingController < ApplicationController
  def index
    ranking = []
    User.all.each do |user|
      point = 0
      Song.all.each do |song|
        if record = user.records.find_by_song_id(song, :order=> 'created_at desc')
          point += record.score.to_f / (song.notes*2).to_f * 100
        end
      end
      ranking.push({'user'=>user, 'point'=>point})
    end
    @ranking = ranking.sort{|a,b| b['point'] <=> a['point']}
  end
end
