class PlacesController < ApplicationController

  def index
    @places = Place.all()
  end


  def create
    @place = Place.new(place_params)
    @place.save

    redirect_to "/"
  end


  private

  def place_params
    params.permit(:name, :longitude, :latitude)
  end

end
