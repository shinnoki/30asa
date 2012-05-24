class HomeController < ApplicationController
  def index
    @linebbs = Linebb.find(:all, :order=>'created_at desc', :limit=>5)
    @new_linebb = Linebb.new
    @records = Record.find(:all, :order=>'created_at desc', :limit=>20)
    @histories = History.find(:all, :order=>'created_at desc', :limit=>5)
  end
end
