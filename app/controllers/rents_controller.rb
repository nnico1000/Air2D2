class RentsController < ApplicationController
  def new
    @droid = Droid.find(params[:droid_id])
    @rent = Rent.new
  end
end
