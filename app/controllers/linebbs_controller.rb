class LinebbsController < InheritedResources::Base
  def create
    @linebb = Linebb.create(params[:linebb])
    redirect_to root_path
  end
  
  def index
    @linebbs = Linebb.paginate(:page => params[:page],:order => 'created_at desc', :per_page => 50)
  end
end
