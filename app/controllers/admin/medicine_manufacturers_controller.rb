class Admin::MedicineManufacturersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :admin_required

  def index
    @medicine_manufacturers = MedicineManufacturer.all.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @medicine_manufacturer = MedicineManufacturer.find(params[:id])
    @medicines = @medicine_manufacturer.medicines.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @medicine_manufacturer = MedicineManufacturer.new
  end

  def create
    @medicine_manufacturer = MedicineManufacturer.new(medicine_manufacturer_params)

    if @medicine_manufacturer.save
      redirect_to admin_medicine_manufacturers_path
    else
      render :new
    end
  end

  def edit
    @medicine_manufacturer = MedicineManufacturer.find(params[:id])
  end

  def update
    @medicine_manufacturer = MedicineManufacturer.find(params[:id])
    if @medicine_manufacturer.update(medicine_manufacturer_params)
      redirect_to admin_medicine_manufacturers_path
    else
      render :edit
    end
  end

  def destroy
    @medicine_manufacturer = MedicineManufacturer.find(params[:id])

    @medicine_manufacturer.destroy

    redirect_to admin_medicine_manufacturers_path
  end

  private

  def medicine_manufacturer_params
    params.require(:medicine_manufacturer).permit(:name, :website, :contact_info)
  end
end
