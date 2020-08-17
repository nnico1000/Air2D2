class DroidsController < ApplicationController

  def show
    @droid = Droid.find(params[:id])
  end

  def edit
    @droid = Droid.find(params[:id])
  end

  def update
  end

end
