class LinebbsController < InheritedResources::Base
  def create
    @linebb = Linebb.create(params[:linebb])
    redirect_to root_path
  end
end
