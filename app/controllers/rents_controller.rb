class RentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_droid, only: [:show, :new, :create]

  def show
    @rent = Rent.find(params[:id])
  end

  def new
    @rent = Rent.new
    @rent = 12
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.droid = @droid
    @rent.user = current_user
    @rent.save
    redirect_to droid_path(@droid)
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy

    redirect_to droid_path(@rent.droid_id)
  end

  private

  def rent_params
    params.require(:rent).permit(:start_year, :end_year)
  end

  def set_droid
    @droid = Droid.find(params[:droid_id])
  end
end
