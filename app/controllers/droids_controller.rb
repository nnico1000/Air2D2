class DroidsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create]

  def index
  @droids = Droid.all
  end

  def show
    @droid = Droid.find(params[:id])
  end

  def edit
    @droid = Droid.find(params[:id])
  end

  def update
    @droid = Droid.find(params[:id])
    @droid.update(params_droid)
    @droid.user = current_user
    @droid.save

    redirect_to droids_path
  end

  def new
    @user = current_user
    @droid = Droid.new
  end

  def create
    @droid = Droid.new(params_droid)
    @user = current_user

    @droid.user = @user
    @droid.save

    redirect_to droids_path
  end

  def destroy
    @droid = Droid.find(params[:id])
    @droid.destroy

    redirect_to droids_path
  end

  private

  def params_droid
    params.require(:droid).permit(:name, :category, :builder, :age, :desciption, :era)
  end
end
