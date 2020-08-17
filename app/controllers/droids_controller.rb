class DroidsController < ApplicationController
  def edit
    @droid = Droid.find(params[:id])
  end

  def update
    @droid = Droid.new(params_droid)
    @droid.user = current_user
    @droid.save
    redirect_to droids_path
  end
end
