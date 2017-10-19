class UsersController < ApplicationController
  before_action :admin_required, :only => [:index]
  before_action :inspector_required, :only => [:inspect]

  def index
    @users = User.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def inspect
    @users = User.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)

  end
end
