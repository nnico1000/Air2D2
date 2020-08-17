class RentsController < ApplicationController
  def new
    @droid = Droid.find(params[:droid_id])
    @rent = Rent.new
  end

  def create
  end

  def destroy
  end
end
