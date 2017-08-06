class ApisearchesController < ApplicationController
  layout "admin"
  before_action :admin_required
  def index
    @apisearches = Apisearch.all
  end
end
