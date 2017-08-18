class IndexController < ApplicationController
  def index
    @help_requests = HelpRequest.where(urgent: true).last(10)
    @news = News.last(5)
    @facilities = Facility.all
    @workorder = Workorder.last(5)
    @building = Building.where(user_id: current_user)
    if current_user.role == 'admin'
      if session[:current_building_id] == nil
        if @building == nil
          redirect_to '/buildings/new'
        elsif @building.count == 1
          session[:current_building_id] = @building.ids
          redirect_to 'root_path'
        elsif @building.count > 1
          redirect_to '/buildings/show'
        end
        else
          @buildingname = Building.find(session[:current_building_id])
        end
      end
      if current_user.role == 'janitor'
        redirect_to '/workorders'
      end
    end
end
