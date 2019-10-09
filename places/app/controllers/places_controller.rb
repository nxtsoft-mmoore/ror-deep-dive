class PlacesController < ApplicationController

  def index
    @places = Place.all()
  end

  def show
    @place = Place.find(params[:id])
    render "detail"
  end

  def create
    @place = Place.new(place_params)
    @place.save

    redirect_to "/"
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    redirect_to "/"
  end

  def update
    @place = Place.find(params[:id])
    @place.update place_params

    redirect_to @place
  end

  private

  def place_params
    params.permit(:name, :longitude, :latitude)
  end

end
