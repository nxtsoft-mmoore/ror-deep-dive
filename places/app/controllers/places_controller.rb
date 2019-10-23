class PlacesController < ApplicationController

  def index

    if request.location.latitude
        @session_info = {
          "lat" => request.location.latitude,
          "long" => request.location.longitude,
        }
    else
      @session_info = {
        "lat" => "35.7596",
        "long" => "79.0193",
      }
    end

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

  def api_list
    @places = Place.all()
    render json: @places
  end


  private

  def place_params
    params.permit(:name, :longitude, :latitude)
  end

end
