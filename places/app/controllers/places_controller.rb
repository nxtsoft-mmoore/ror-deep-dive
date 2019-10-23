class PlacesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index

    if request.location.latitude
        @session_info = {
          "lat" => request.location.latitude,
          "long" => request.location.longitude,
        }
    else
      @session_info = {
        "lat" => 33.749,
        "long" => -84.388,
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

  def api_distance
    @distance = Geocoder::Calculations.distance_between([params[:lat1],params[:long1]], [params[:lat2],params[:long2]])
    render json: @distance
  end

  private

  def place_params
    params.permit(:name, :longitude, :latitude)
  end

  def api_disatnce_params
    params.permit(:lat1, :long1, :lat2, :long2)
  end
end
