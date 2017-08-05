class Admin::MedicineManufacturersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :admin_required

  def index
    @medicine_manufacturers = Medicine_manufacturer.all.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @medicine_manufacturer = Medicine_manufacturer.new
  end

  def create
    @medicine_manufacturer = Medicine_manufacturer.new(medicine_manufacturer_params)

    if @medicine_manufacturer.save
      redirect_to medicine_manufacturers_path
    else
      render :new
    end
  end

  def edit
    @medicine_manufacturer = Medicine_manufacturer.find(params[:id])
  end

  def update
    @medicine_manufacturer = Medicine_manufacturer.find(params[:id])
    if @medicine_manufacturer.update(medicine_manufacturer_params)
      redirect_to admin_medicine_manufacturers_path
    else
      render :edit
    end
  end

  def destroy
    @medicine_manufacturer = Medicine_manufacturer.find(params[:id])

    @medicine_manufacturer.destroy

    redirect_to medicine_manufacturers_path
  end

  private

  def medicine_manufacturer_params
    params.require(:medicine_manufacturer).permit(:name, :website, :contact_info)
  end
end
