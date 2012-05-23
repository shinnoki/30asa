#coding: utf-8
class RecordsController < InheritedResources::Base
  def index
    @user = User.find(params[:user_id])
    @records = @user.records
  end
  
  def show
    @user = User.find(params[:user_id])
    @record = Record.find(params[:id])
    @song = @record.song
  end
  
  def new
    @user = User.find(params[:user_id])
    @song = Song.find(params[:song_id])
    @record = Record.new
    @old_record = Record.find(:first,
                              :order=>'created_at desc',
                              :conditions=>["user_id=? AND song_id=?",
                              @user, @song])
  end
  
  def edit
    @user = User.find(params[:user_id])
    @record = Record.find(params[:id])
    @song = @record.song
    @old_record = @record
  end
  
  def new_lump
    @user = User.find(params[:user_id])
    @songs = Song.all
    @new_records = (1..@songs.count).map do
      Record.new
    end
  end
  
  
  
  def create
    @record = Record.new(params[:record])
    @user = @record.user
    @song = @record.song
    if @record.save
      flash[:notice] = 'スコアを1件更新しました'
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def create_lump
    @user = User.find(params[:user_id])
    @new_records = (0..params[:records].count-1).map do |i|
      Record.new(params[:records][i])
    end
    count = 0
    Record.transaction do
      @new_records.each do |new_record|
        old_record = Record.find(:first,
                                 :order=>'created_at desc',
                                 :conditions=>["user_id=? AND song_id=?",
                                 new_record.user, new_record.song])
        if new_record.score and (new_record.score != old_record.score)
          new_record.save!
          count += 1
        end
      end
    end
    if count > 0
      flash[:notice] = 'スコアを%d件更新しました' % count
    end
    redirect_to @user
    
  rescue => e
    render :action => 'new_lump'
  end
end
