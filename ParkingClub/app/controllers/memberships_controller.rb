class MembershipsController < ApplicationController

  before_action :require_login
  before_action :require_lot, except: [:index]

  def index
    @memberships = Membership.find(params[:user_id])
  end

  def new
    @membership = @lot.memberships.build
  end

  def create
    @membership = @lot.memberships.build(membership_params)
    @membership.user_id = current_user.id
    if @membership.save
      redirect_to user_path(id: current_user.id)
    else
      redirect_to lot_path(@lot), notice: "Something went wrong"
    end
  end

  protected

  def membership_params 
    params.require(:membership).permit(:user_id, :lot_id, :start_time, :end_time)
  end

  def require_lot
    @lot = Lot.find(params[:lot_id])
  end

end
