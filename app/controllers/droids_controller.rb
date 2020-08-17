class DroidsController < ApplicationController
  def edit
    @droid = Droid.find(params[:id])
  end

  def update
  end
end
