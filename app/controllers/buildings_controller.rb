class BuildingsController < ApplicationController
  def new
    @building = Building.new
  end

  def create
    @building = Building.new building_params
    if @building.save
      flash[:notice] = "New house created!"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def building_params
    params.require(:building).permit(:name)
  end
end
