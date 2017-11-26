class Admin::CertificatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  layout "admin"
  before_action :admin_required

  def show
    @certificate = Certificate.find(params[:id])
  end

  def index
    @certificates = Certificate.all.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @certificate = Certificate.new
  end

  def create
    @certificate = Certificate.new(certificate_params)

    if @certificate.save
      redirect_to admin_certificates_path
    else
      render :new
    end
  end

  def edit
    @certificate = Certificate.find(params[:id])
  end

  def update
    @certificate = Certificate.find(params[:id])
    if @certificate.update(certificate_params)
      redirect_to admin_certificates_path
    else
      render :edit
    end
  end

  def destroy
    @certificate = Certificate.find(params[:id])
    @certificate.destroy
    redirect_to admin_certificates_path
  end


  def search
    if params[:search].present?
      @certificates = Certificate.search(params[:search], fields:["fda", "eu", "who", "pics", "manufacturer"], page: params[:page], per_page: 20)
    else
      @certificates = Certificate.all.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def import
    Certificate.import(params[:file])
    redirect_to admin_certificates_path, notice: "Certificates imported."
  end

  private

  def certificate_params
    params.require(:certificate).permit(:manufacturer, :fda, :eu, :who, :pics, :medicine_manufacturer_id)
  end
end
