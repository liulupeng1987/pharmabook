class Admin::MedicineManufacturersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :admin_required

  def index
    @medicine_manufacturers = MedicineManufacturer.all.order("created_at DESC").order('created_at ASC').paginate(:page => params[:page], :per_page => 20)
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

  def search
    if params[:search].present?
      @medicine_manufacturers = MedicineManufacturer.search(params[:search], fields:["name", "id"], page: params[:page], per_page: 20)
    else
      @medicine_manufacturers = MedicineManufacturer.all.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def import
    MedicineManufacturer.import(params[:file])
    redirect_to admin_medicine_manufacturers_path, notice: "Medicine Manufacturers imported."
  end


  private

  def medicine_manufacturer_params
    params.require(:medicine_manufacturer).permit(:name, :website, :email, :chinesename, :contact_info)
  end
end
