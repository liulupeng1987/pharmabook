class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :admin_required
  def index
    @users = User.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
      format.xls { send_data @users.to_csv(col_sep: "\t") }
      format.xlsx { send_data @users.to_csv(col_sep: "\t") }
    end
  end
end
