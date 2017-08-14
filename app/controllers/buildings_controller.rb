class BuildingsController < ApplicationController
  def new
    @building = Building.new
  end

 def create
    @building = Building.new building_params
    @building.update(user_id: current_user.id)
    if @building.save
      flash[:notice] = "New house created!"
      @building = Building.find_by(user_id: current_user)
      session[:current_building_id] = @building.id
      redirect_back(fallback_location: root_path)
    end
  end

 private

 def building_params
    params.require(:building).permit(:name)
  end
end
