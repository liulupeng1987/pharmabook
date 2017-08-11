class MedicinesController < ApplicationController

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
        medsearch.user_id = current_user.id
        medsearch.user_email = current_user.email
        medsearch.save
        @medicines = Medicine.search(params[:search], fields:["name", "number", "manufacturer"], page: params[:page], per_page: 20)
      else
        @medicines = Medicine.all.paginate(:page => params[:page], :per_page => 20)
      end
    end

    private
    def medicine_params
      params.require(:medicine).permit(:name, :number, :strength, :manufacturer_name, :medicine_manufacturer_id)
    end
end
