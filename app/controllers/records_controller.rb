class RecordsController < InheritedResources::Base
  def show
    redirect_to :controller=>'users'
  end
end
