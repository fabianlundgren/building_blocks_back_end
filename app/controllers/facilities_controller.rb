class FacilitiesController < ApplicationController

  def index
    @facilities = Facility.all
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new facility_params
    if @facility.save
      flash[:notice] = "New facility created!"
      redirect_back(fallback_location: new_facility_path)
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    if @facility.destroy
      flash[:notice] = "Facility Deleted!"
      redirect_back(fallback_location: facilities_path)
    end
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :description, :status, :rules)
  end
end
