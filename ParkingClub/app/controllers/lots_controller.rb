class LotsController < ApplicationController

  def index
    @lots = Lot.all
  end

  def new
    if current_user.owner
    @lot = Lot.new
    end
  end

  def create
    if current_user.owner
    @lot = Lot.new(lot_params)
      if @lot.save
        redirect_to lot_path(@lot)
      else
        render :new
      end
    end
  end

  def show
    @lot = Lot.find(params[:id])
  end

  protected

  def lot_params
    params(:lot).permit(:name, :country, :province, :city, :latitude, :longitude, :address, :owner_id)
  end


end
