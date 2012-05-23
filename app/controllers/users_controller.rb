# encoding: utf-8 
class UsersController < InheritedResources::Base
  def new_record
    records = params[:records]
    user = User.find(params[:user])
    records.each do |record|
      if ( params[:all] or record[:update] ) and not record[:score].blank?
        song = Song.find(record[:song])
        score = record[:score].to_i
        if score < 0 or score > song.notes
          user.errors.add(:records, 'Unvalid Record')
        else
          Record.create(:user_id=>params[:user], :song_id=>record[:song], :score=>record[:score])
        end
      end
    end
    redirect_to user_path(params[:user])
  end
end
