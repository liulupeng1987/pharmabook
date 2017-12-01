class CertificatesController < ApplicationController
  before_action :authenticate_user! , only: [:search]

  def index
    @certificates = Certificate.all.paginate(:page => params[:page], :per_page => 20)

  if params[:filter] == "fda"
      @certificates = Certificate.where.not(:fda => nil).paginate(:page => params[:page], :per_page => 20)
    elsif params[:filter] == "eu"
      @certificates = Certificate.where.not(:eu => nil).paginate(:page => params[:page], :per_page => 20)
    elsif params[:filter] == "who"
      @certificates = Certificate.where.not(:who => nil).paginate(:page => params[:page], :per_page => 20)
    elsif params[:filter] == "pics"
      @certificates = Certificate.where.not(:pics => nil).paginate(:page => params[:page], :per_page => 20)
    end
  end


    def search
      if params[:search].present?
        certsearch = Certsearch.new
        certsearch.query = params[:search]
        certsearch.user = current_user
        certsearch.save

        @certificates = Certificate.search(params[:search], fields:["manufacturer", "fda", "eu", "who", "pics"], order: {id: :asc}, page: params[:page], per_page: 20)

      else
        @certificates = Certificate.all.order("created_at ASC").paginate(:page => params[:page], :per_page => 20)
      end

    end
end
