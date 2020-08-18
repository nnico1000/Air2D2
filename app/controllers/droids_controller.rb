class DroidsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create]
  before_action :set_droid, only: [:show, :edit, :update, :destroy]

  def index
    # if params["search"]
    #   @era = params["search"]["era"]
    #   @category = params["search"]["category"]
    #   @builder = params["search"]["builder"]
    #   @droids.each do |droid|
    #     if droid.ear ==
    #   end
    # end
    @droids = policy_scope(Droid)
    authorize @droids
  end

  def show
    # @droid = Droid.find(params[:id])
    authorize @droid
  end

  def edit
    # @droid = Droid.find(params[:id])
    authorize @droid
  end

  def update
    # @droid = Droid.find(params[:id])
    authorize @droid
    @droid.update(params_droid)
    @droid.user = current_user
    @droid.save

    redirect_to droids_path
  end

  def new
    @user = current_user
    @droid = Droid.new

    authorize @droid
  end

  def create
    @droid = Droid.new(params_droid)
    @user = current_user

    @droid.user = @user

    if @droid.save
      redirect_to droids_path
    end

    authorize @droid
  end

  def destroy
    # @droid = Droid.find(params[:id])
    authorize @droid
    @droid.destroy

    redirect_to droids_path
  end

  private

  def params_droid
    params.require(:droid).permit(:name, :category, :builder, :age, :desciption, :era, :price_per_year, :photo)
  end

  def set_droid
    @droid = Droid.find(params[:id])
  end
end
