class ApisearchesController < ApplicationController
  before_action :admin_required, :only => [:index]
  before_action :inspector_required, :only => [:inspect]


  def index
    @apisearches = Apisearch.all.order("created_at DESC")
    respond_to do |format|
      format.html
      format.csv { send_data @apisearches.to_csv }
      format.xls { send_data @apisearches.to_csv(col_sep: "\t") }
      format.xlsx { send_data @apisearches.to_csv(col_sep: "\t") }
    end
  end

  def inspect
    @apisearches = Apisearch.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end
end
