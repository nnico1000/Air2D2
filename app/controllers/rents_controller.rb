class RentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_droid, only: [:new, :create, :overlaps]

  def show
    @rent = Rent.find(params[:id])
    authorize @rent
  end

  def new
    @rent = Rent.new
    authorize @rent
  end

  def create
    @rent = Rent.new(rent_params)
    authorize @rent
    @rent.droid = @droid
    @rent.user = current_user
    if @droid.booked?(@rent.start_year, @rent.end_year, @droid) && @rent.save
      # cas ou la date d'arrivée est après la date de départ + il n'est pas booké pour ces dates + on a réussi à sauvegarder le rent - il a passé ses validations
      redirect_to droid_path(@droid)
    elsif !@droid.booked?(@rent.start_year, @rent.end_year, @droid)
      flash[:alert] = "Droid already booked at these dates"
      render 'droids/show'
    else
      flash[:alert] = @rent.errors.full_messages.join(", ")
      render 'droids/show'
    end
  end

  def destroy
    @rent = Rent.find(params[:id])
    authorize @rent
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
