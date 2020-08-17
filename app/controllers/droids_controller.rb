class DroidsController < ApplicationController

  def show
    @droid = Droid.find(params[:id])
  end

  def edit
    @droid = Droid.find(params[:id])
  end

  def update
    @droid = Droid.new(params_droid)
    @droid.user = current_user
    @droid.save
    redirect_to droids_path
  end

  def new
    @user = User.find(params[:user_id])
    @droid = Droid.new
  end

  def create
    @droid = Droid.new(droid_params)
    @user = current_user

    @droid.user = @droid
    @droid.save
  end
end
