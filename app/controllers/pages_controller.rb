class PagesController < ApplicationController
  before_action :authenticate_user!, only: []
  def home
  end
end
