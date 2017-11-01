class Admin::AndasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :admin_required

  def show
    @anda = Anda.find(params[:id])
  end

  def index
    @andas = Anda.all.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @anda = Anda.new
  end

  def create
    @anda = Anda.new(anda_params)

    if @anda.save
      redirect_to admin_andas_path
    else
      render :new
    end
  end

  def edit
    @anda = Anda.find(params[:id])
  end

  def update
    @anda = Anda.find(params[:id])
    if @anda.update(anda_params)
      redirect_to admin_andas_path
    else
      render :edit
    end
  end

  def destroy
    @and = Anda.find(params[:id])
    @anda.destroy
    redirect_to admin_andas_path
  end


      def search
        if params[:search].present?
          @andas = Anda.search(params[:search], fields:["product", "number", "manufacturer"], page: params[:page], per_page: 20)
        else
          @andas = Anda.all.paginate(:page => params[:page], :per_page => 20)
        end
      end

  private

  def anda_params
    params.require(:anda).permit(:product, :strength, :number, :medicine_manufacturer_id, :manufacturer)
  end
end
