class MedicineManufacturersController < ApplicationController
  def show
    @medicine_manufactuer = Medicine_manufactuer.find(params[:id])
  end
  def index
    @medicine_manufactuers = Medicine_manufactuer.all.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @medicine_manufactuer = Medicine_manufactuer.new
  end

  def create
    @medicine_manufactuer = Medicine_manufactuer.new(medicine_manufactuer_params)

    if @medicine_manufactuer.save
      redirect_to admin_medicine_manufactuers_path
    else
      render :new
    end
  end

  def edit
    @medicine_manufactuer = Medicine_manufactuer.find(params[:id])
  end

  def update
    @medicine_manufactuer = Medicine_manufactuer.find(params[:id])
    if @medicine_manufactuer.update(medicine_manufactuer_params)
      redirect_to medicine_manufactuers_path
    else
      render :edit
    end
  end

  def destroy
    @medicine_manufactuer = Medicine_manufactuer.find(params[:id])

    @medicine_manufactuer.destroy

    redirect_to medicine_manufactuers_path
  end

  private

  def medicine_manufactuer_params
    params.require(:medicine_manufactuer).permit(:name, :website, :contact_info)
  end
end
