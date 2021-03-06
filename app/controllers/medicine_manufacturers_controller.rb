class MedicineManufacturersController < ApplicationController
  before_action :authenticate_user! , only: [:search]
  def show
    @medicine_manufacturer = MedicineManufacturer.find(params[:id])
    @apis = @medicine_manufacturer.apis.paginate(:page => params[:page], :per_page => 20)
    @medicines = @medicine_manufacturer.medicines.paginate(:page => params[:page], :per_page => 20)
    set_page_title @medicine_manufacturer.name
  end

  def index
    @medicine_manufacturers = MedicineManufacturer.all.order('id ASC').paginate(:page => params[:page], :per_page => 20)
  end


  def search
    if params[:search].present?
      @medicine_manufacturers = MedicineManufacturer.search(params[:search], fields:["name", "contact_info"], page: params[:page], per_page: 20)
    else
      @medicine_manufacturers = MedicineManufacturer.all.paginate(:page => params[:page], :per_page => 20)
    end
  end

end
