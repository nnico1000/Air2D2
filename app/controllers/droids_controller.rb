class DroidsController < ApplicationController

    def index
    @droids = Droid.all
  end

  def edit
    @droid = Droid.find(params[:id])
  end

  def update
  end
end
