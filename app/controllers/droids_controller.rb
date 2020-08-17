class DroidsController < ApplicationController
  def show
    @droid = Droid.find(params[:id])
  end
end
