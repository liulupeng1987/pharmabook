class ApisController < ApplicationController


  def show
    @api = Api.find(params[:id])
  end

  def index
    @apis = Api.all.paginate(:page => params[:page], :per_page => 20)
  end

  def search
    if params[:search].present?
      @apis = Api.search(params[:search], fields:["name", "number", "manufacturer"], page: params[:page], per_page: 20)
    else
      @apis = Api.all.paginate(:page => params[:page], :per_page => 20)
    end
  end


end
