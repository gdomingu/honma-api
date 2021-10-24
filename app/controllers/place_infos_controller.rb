class PlaceInfosController < ApplicationController

  def index
    @place_infos = PlaceInfo.all
  end
  
  def show
    @place_info = PlaceInfo.find(params[:id])
    latitude = @place_info.latitude
    longtitude = @place_info.longtitude
    @address = Geocoder.search([latitude, longtitude]).first.address
  end
end