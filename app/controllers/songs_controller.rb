class SongsController < InheritedResources::Base
  def show
    @song = Song.find(params[:id])
    users = User.all
    users_have_records, users_no_records = users.partition{ |user|
      @song.records.find_by_user_id(user, :order=>'created_at desc')
    }
    records = users_have_records.map do |user|
      @song.records.find_by_user_id(user, :order=>'created_at desc')
    end
    @records = Record.find_all_by_id(records, :order=>'score desc')
    users_have_records_sorted = @records.map do |record|
      record.user
    end
    @users = users_have_records_sorted + users_no_records 
  end
end
