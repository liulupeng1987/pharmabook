class ApisController < ApplicationController


  def show
    @api = Api.find(params[:id])
  end

  def index
    @apis = Api.all.paginate(:page => params[:page], :per_page => 20)
  end

  def search
    if params[:search].present?
      apisearch = Apisearch.new
      apisearch.query = params[:search]
      apisearch.user_id = current_user.id
      apisearch.user_email = current_user.email
      apisearch.save

      @apis = Api.search(params[:search], fields:["name", "number", "manufacturer"], page: params[:page], per_page: 20)
    else
      @apis = Api.all.paginate(:page => params[:page], :per_page => 20)
    end
  end


end
