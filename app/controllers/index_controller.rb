class IndexController < ApplicationController
  def index
    @buildings = Building.where(user_id: current_user)
    if current_user.admin?
      if session[:current_building_id] == nil
        if @buildings.count < 1
          redirect_to new_building_path
        elsif @buildings.count == 1
          @building = Building.find_by(id: @buildings.ids)
          session[:current_building_id] = @building.id
          redirect_back(fallback_location: root_path)
        elsif @buildings.count > 1
          redirect_to buildings_path
        end
        else
          @building_name = Building.find(session[:current_building_id])
          @help_requests = HelpRequest.where(urgent: true, building_id: session[:current_building_id]).last(10)
          @news = News.where(building_id: session[:current_building_id]).last(5)
          @facilities = Facility.where(building_id: session[:current_building_id])
          @workorder = Workorder.where(building_id: session[:current_building_id]).last(5)
        end
      end
      if current_user.janitor?
        user = User.find_by(id: current_user.id)
        session[:current_building_id] = user.building_id
        redirect_to building_workorders_path(user.building_id)
      end
    end

    def select_building
      @buildingnew = Building.find_by(user_id: current_user, name: params[:post][:category])
      session[:current_building_id] = @buildingnew.id
      redirect_back(fallback_location: root_path)
    end
    @bookings = Booking.where('end_time < ?', Date.today)
    @bookings.destroy_all
end
