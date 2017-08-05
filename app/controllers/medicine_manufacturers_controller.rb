class MedicineManufacturersController < ApplicationController
  def show
    @medicine_manufacturer = MedicineManufacturer.find(params[:id])
  end

  def index
    @medicine_manufacturers = MedicineManufacturer.all.paginate(:page => params[:page], :per_page => 20)
  end


  def search
    if params[:search].present?
      @medicine_manufacturers = MedicineManufacturer.search(params[:search], fields:["name", "contact_info"], page: params[:page], per_page: 20)
    else
      @medicine_manufacturers = MedicineManufacturer.all.paginate(:page => params[:page], :per_page => 20)
    end
  end

end
