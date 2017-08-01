class ApisController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  
  def show
    @api = Api.find(params[:id])
  end

  def index
    @apis = Api.all
  end

  def new
    @api = Api.new
  end

  def create
    @api = Api.new(api_params)

    if @api.save
      redirect_to apis_path
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
      redirect_to apis_path
    else
      render :edit
    end
  end

  def destroy
    @api = Api.find(params[:id])

    @api.destroy

    redirect_to apis_path
  end

  private

  def api_params
    params.require(:api).permit(:name, :number, :manufacturer)
  end

end
