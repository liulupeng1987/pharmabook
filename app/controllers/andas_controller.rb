class AndasController < ApplicationController
  before_action :authenticate_user! , only: [:search]
  def show
    @anda = Anda.find(params[:id])
  end

  def index
    @andas = Anda.all.paginate(:page => params[:page], :per_page => 20)
  end


    def search
      if params[:search].present?
        andasearch = Andasearch.new
        andasearch.query = params[:search]
        andasearch.user = current_user
        andasearch.save

        @andas = Anda.search(params[:search], fields:["product", "number", "manufacturer"], order: {id: :asc}, page: params[:page], per_page: 20)
      else
        @andas = Anda.all.order("created_at ASC").paginate(:page => params[:page], :per_page => 20)
      end
    end
end
