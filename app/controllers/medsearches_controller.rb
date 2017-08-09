class MedsearchesController < ApplicationController
  before_action :admin_required, :only => [:index]
  before_action :inspector_required, :only => [:inspect]

  def index
    @medsearches = Medsearch.all
  end

  def inspect
    @medsearches = Medsearch.all
  end

end
