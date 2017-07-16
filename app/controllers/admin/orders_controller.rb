class Admin::OrdersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_requried

  def index
    @orders = Order.order("id DESC")
  end
end
