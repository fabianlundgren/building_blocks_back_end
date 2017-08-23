class FacilitiesController < ApplicationController

  def index
    @facilities = Facility.all
    @building = Building.find(session[:current_building_id])
  end

  def show
    @facility = Facility.find(params[:id])
    @building = Building.find(session[:current_building_id])
  end

  def new
    @facility = Facility.new
    @building = Building.find(session[:current_building_id])
  end

  def create
    @facility = Facility.new facility_params
    @facility.update(building_id: session[:current_building_id])
    if @facility.save
      flash[:notice] = "New facility created!"
      redirect_back(fallback_location: new_building_facility_path(session[:current_building_id]))
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    if @facility.destroy
      flash[:notice] = "Facility Deleted!"
      redirect_back(fallback_location: building_facilities_path(session[:current_building_id]))
    end
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :description, :status, :rules)
  end
end
