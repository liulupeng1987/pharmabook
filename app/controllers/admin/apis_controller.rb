class Admin::ApisController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :admin_required

  def show
    @api = Api.find(params[:id])
  end

  def index
    @apis = Api.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @api = Api.new
  end

  def create
    @api = Api.new(api_params)

    if @api.save
      redirect_to admin_apis_path
    else
      render :new
    end
  end

  def edit
    @api = Api.find(params[:id])
  end

  def update
    @api = Api.find(params[:id])
    if @api.update(api_params)
      redirect_to admin_apis_path
    else
      render :edit
    end
  end

  def destroy
    @api = Api.find(params[:id])

    @api.destroy

    redirect_to admin_apis_path
  end


    def search
      if params[:search].present?
        @apis = Api.search(params[:search], fields:["name", "number", "manufacturer"], page: params[:page], per_page: 20)
      else
        @apis = Api.all.paginate(:page => params[:page], :per_page => 20)
      end
    end

    def import
      Api.import(params[:file])
      redirect_to admin_apis_path, notice: "Apis imported."
    end

  private

  def api_params
    params.require(:api).permit(:name, :number, :manufacturer, :medicine_manufacturer_id)
  end
end
