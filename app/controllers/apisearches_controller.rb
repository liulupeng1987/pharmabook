class ApisearchesController < ApplicationController
  before_action :admin_required, :only => [:index]
  before_action :inspector_required, :only => [:inspect]


  def index
    @apisearches = Apisearch.all
  end

  def inspect
    @apisearches = Apisearch.all
  end
end
