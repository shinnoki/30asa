#coding: utf-8
class RecordsController < InheritedResources::Base
  def index
    @records = Record.all
  end
  
  def show
    @record = Record.find(params[:id])
    @user = @record.user
    @song = @record.song
  end
  
  before_filter :authenticate_user!
  def new
    @user = current_user
    @song = Song.find(params[:song_id])
    @record = Record.new
    @old_record = Record.find(:first,
                              :order=>'created_at desc',
                              :conditions=>["user_id=? AND song_id=?",
                              @user, @song])
  end
  
  before_filter :authenticate_user!
  def edit
    @user = current_user
    @record = Record.find(params[:id])
    @song = @record.song
    @old_record = @record
  end
  
  before_filter :authenticate_user!
  def new_lump
    @user = current_user
    @songs = Song.all(:order => 'level, title')
    @new_records = (1..@songs.count).map do
      Record.new
    end
  end
  
  before_filter :authenticate_user!
  def create
    @record = Record.new(params[:record])
    @user = current_user
    @song = @record.song
    if @record.save
      flash[:notice] = 'スコアを1件更新しました'
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  before_filter :authenticate_user!
  def create_lump
    @user = current_user
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
        if new_record.score and (old_record.blank? or (new_record.score != old_record.score))
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
