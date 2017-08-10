class ApisearchesController < ApplicationController
  before_action :admin_required, :only => [:index]
  before_action :inspector_required, :only => [:inspect]


  def index
    @apisearches = Apisearch.all.paginate(:page => params[:page], :per_page => 20)
  end

  def inspect
    @apisearches = Apisearch.all.paginate(:page => params[:page], :per_page => 20)
  end
end
