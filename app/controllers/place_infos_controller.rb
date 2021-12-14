class PlaceInfosController < ApplicationController

  before_action :set_place_info, only: [:show, :edit, :update, :destroy]

  def index
    if params[:dialect_id]
      @place_infos = PlaceInfo.includes(:dialect).where(dialect_id: params[:dialect_id])
    else
      @place_infos = PlaceInfo.includes(:dialect)
    end
  end
  
  def show
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

  def destroy
    @place_info.destroy
    redirect_to place_infos_url, notice: 'Place info was successfully destroyed.'
  end

  private
    def set_place_info
      @place_info = PlaceInfo.find(params[:id])
    end

    def place_info_params
      params.require(:place_info).permit(:name_en, :name_jp, :img_url, :dialect_id, :latitude, :longtitude, :category, :description, images: [])
    end
end