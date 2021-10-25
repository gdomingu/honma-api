class PlaceInfosController < ApplicationController

  def index
    @place_infos = PlaceInfo.all
  end
  
  def show
    @place_info = PlaceInfo.find(params[:id])
    if @place_info.latitude.present? && @place_info.longtitude.present?
      latitude = @place_info.latitude
      longtitude = @place_info.longtitude
      @address = Geocoder.search([latitude, longtitude]).first.address
    end
  end

  def edit
  end

  def new
    @place_info = PlaceInfo.new(dialect_id: params[:dialect_id])
  end

  def create
    @place_info = PlaceInfo.new(place_info_params)
    if @place_info.save
      redirect_to @place_info, notice: 'Place Info was successfully created.' 
    else
      render :new
    end
  end

  # PATCH/PUT /grammars/1
  def update
    if @place_info.update(place_info_params)
      redirect_to @place_info, notice: 'Place Info was successfully updated.' 
    else
      render :new
    end
  end

  private
    def place_info_params
      params.require(:place_info).permit(:name_en, :name_jp, :img_url, :dialect_id, :latitude, :longtitude)
    end
end