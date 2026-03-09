class PlacesController < ApplicationController
  def index
    if @current_user.nil?
      redirect_to "/login"
    else
      @places = Place.all
    end
  end

  def show
    if @current_user.nil?
      redirect_to "/login"
    else
      @place = Place.find_by({ "id" => params["id"] })
      if @current_user.present?
        @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] })
      else
        @entries = []
      end
    end
  end

  def new
    if @current_user.nil?
      redirect_to "/login"
    end
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end
end