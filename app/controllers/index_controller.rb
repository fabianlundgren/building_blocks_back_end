class IndexController < ApplicationController
  def index
    @help_requests = HelpRequest.where(urgent: true).last(10)
    @news = News.last(5)
    @facilities = Facility.all
    @workorder = Workorder.last(5)
    @buildings = Building.where(user_id: current_user)
    if current_user.role == 'admin'
      if session[:current_building_id] == nil
        if @buildings.count < 1
          redirect_to '/buildings/new'
        elsif @buildings.count == 1
          @building = Building.find_by(id: @buildings.ids)
          session[:current_building_id] = @building.id
          redirect_back(fallback_location: root_path)
        elsif @buildings.count > 1
          redirect_to '/buildings/show'
        end
        else
          @buildingname = Building.find(session[:current_building_id])
        end
      end
      if current_user.role == 'janitor'
        user = User.find_by(id: current_user.id)
        session[:current_building_id] = user.building_id
        redirect_to "/buildings/#{user.building_id}/workorders"
      end
    end
end
