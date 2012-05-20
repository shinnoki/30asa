ActiveAdmin.register User do
  def new_record song
    Record.new(:user_id=>user,:song_id=>song, :score_id=>params[user][song])
  end
  
end
