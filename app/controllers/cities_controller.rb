class CitiesController < ApplicationController
  def index
  end

  def show
    @current_city = City.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end
end
