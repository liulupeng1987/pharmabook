class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :admin_required
  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 20)
  end
end
