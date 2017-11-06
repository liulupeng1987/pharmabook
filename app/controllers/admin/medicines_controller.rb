class Admin::MedicinesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :admin_required

  def show
    @medicine = Medicine.find(params[:id])
  end

  def index
    @medicines = Medicine.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(medicine_params)

    if @medicine.save
      redirect_to admin_medicines_path
    else
      render :new
    end
  end

  def edit
    @medicine = Medicine.find(params[:id])
  end

  def update
    @medicine = Medicine.find(params[:id])
    if @medicine.update(medicine_params)
      redirect_to admin_medicines_path
    else
      render :edit
    end
  end

  def destroy
    @medicine = Medicine.find(params[:id])

    @medicine.destroy

    redirect_to admin_medicines_path
  end


    def search
      if params[:search].present?
        @medicines = Medicine.search(params[:search], fields:["name", "number", "manufacturer_name"], page: params[:page], per_page: 20)
      else
        @medicines = Medicine.all.paginate(:page => params[:page], :per_page => 20)
      end
    end

    def import
      Medicine.import(params[:file])
      redirect_to admin_medicines_path, notice: "Medicine Manufacturers imported."
    end

  private

  def medicine_params
    params.require(:medicine).permit(:name, :number, :strength, :manufacturer_name, :medicine_manufacturer_id)
  end
end
