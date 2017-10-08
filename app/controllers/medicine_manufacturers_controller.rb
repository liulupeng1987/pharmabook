class MedicineManufacturersController < ApplicationController
  before_action :authenticate_user! , only: [:new]
  def show
    @medicine_manufacturer = MedicineManufacturer.find(params[:id])
    @apis = @medicine_manufacturer.apis.paginate(:page => params[:page], :per_page => 20)
    @medicines = @medicine_manufacturer.medicines.paginate(:page => params[:page], :per_page => 20)
  end

  def index
    @medicine_manufacturers = MedicineManufacturer.all.order('id ASC').paginate(:page => params[:page], :per_page => 20)
  end


  def search
    if params[:search].present?
      @medicine_manufacturers = MedicineManufacturer.search(params[:search], fields:["name", "contact_info"], order: {"id" => "ASC"}, page: params[:page], per_page: 20)
    else
      @medicine_manufacturers = MedicineManufacturer.all.order('id ASC').paginate(:page => params[:page], :per_page => 20)
    end
  end

end
