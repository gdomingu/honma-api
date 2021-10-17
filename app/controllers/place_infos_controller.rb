class PlaceInfosController < ApplicationController

  def index
    @place_infos = PlaceInfo.all
  end
  
  def show
    @place_info = PlaceInfo.find(params[:id])
  end
end