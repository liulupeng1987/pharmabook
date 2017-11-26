class CertificatesController < ApplicationController
  before_action :authenticate_user! , only: [:search]

  def index
    @certificates = Certificate.all.paginate(:page => params[:page], :per_page => 20)
  end


    def search
      if params[:search].present?

        @certificates = Certificate.search(params[:search], fields:["manufacturer", "fda", "eu", "who", "pics"], order: {id: :asc}, page: params[:page], per_page: 20)
      else
        @certificates = Certificate.all.order("created_at ASC").paginate(:page => params[:page], :per_page => 20)
      end
    end
end
