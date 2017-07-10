class IndexController < ApplicationController
  def index
    @help_requests = HelpRequest.where(urgent: true).last(10)
    @news = News.last(5)
    @facilities = Facility.all
    @workorder = Workorder.last(5)
    @Building = Building.find_by(user_id: current_user)
    if current_user.role == 'admin'
      if @bulding == nil
        redirect_to '/workorders'
      end
    end
    if current_user.role == 'janitor'
      redirect_to '/workorders'
    end
  end
end
