class UsersController < InheritedResources::Base
  def new_record
    Record.new(:user_id=>:user, :song_id=>:song, :score=>params[user][song])
    redirect_to :action=>'show', :id=>:user
  end
end
