class AndasearchesController < ApplicationController
  before_action :admin_required, :only => [:index]
  before_action :inspector_required, :only => [:inspect]


  def index
    @andasearches = Andasearch.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html
      format.csv { send_data @andasearches.to_csv }
      format.xls { send_data @andasearches.to_csv(col_sep: "\t") }
      format.xlsx { send_data @andasearches.to_csv(col_sep: "\t") }
    end
  end

  def inspect
    @andasearches = Andasearch.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end
end
