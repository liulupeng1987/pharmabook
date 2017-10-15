class MedicinesController < ApplicationController
  before_action :authenticate_user! , only: [:search]

    def show
      @medicine = Medicine.find(params[:id])
      @medicine_manufacturer = @medicine.medicine_manufacturer
    end

    def index
      @medicines = Medicine.all.paginate(:page => params[:page], :per_page => 20)
    end

    def search
      if params[:search].present?
        medsearch = Medsearch.new
        medsearch.query = params[:search]
        medsearch.user = current_user
        medsearch.save
        @medicines = Medicine.search(params[:search], fields:["name", "number", "manufacturer"], order: {id: :asc}, page: params[:page], per_page: 20)
      else
        @medicines = Medicine.all.order("created_at ASC").paginate(:page => params[:page], :per_page => 20)
      end
    end

    private
    def medicine_params
      params.require(:medicine).permit(:name, :number, :strength, :manufacturer_name, :medicine_manufacturer_id)
    end
end
