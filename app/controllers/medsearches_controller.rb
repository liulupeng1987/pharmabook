class MedsearchesController < ApplicationController
  layout "admin"
  before_action :admin_required
  def index
    @medsearches = Medsearch.all
  end
end
