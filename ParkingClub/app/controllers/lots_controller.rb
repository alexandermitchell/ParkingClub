class LotsController < ApplicationController

  before_action :require_login

  def index
    @lots = Lot.search(params[:search])
    @json = Lot.search(params[:search]).to_gmaps4rails
  end

  def new
    if current_user.owner
      @lot = current_user.owned_lots.build
    end
  end

  def create
    if current_user.owner
    @lot = current_user.owned_lots.build(lot_params)
      if @lot.save
        redirect_to lot_path(@lot), notice: "Project created!"
      else
        render :new
      end
    end
  end

  def show
    @lot = Lot.find(params[:id])
    @membership = @lot.memberships.build
  end

  protected

  def lot_params
    params.require(:lot).permit(:name, :country, :province, :city, :latitude, :longitude, :address, :owner_id, :daily_rate_in_cents)
  end


end
