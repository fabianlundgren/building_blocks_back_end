class IndexController < ApplicationController
  def index
    @help_requests = HelpRequest.where(urgent: true).last(10)
    @news = News.last(5)
    @facilities = Facility.all
    @workorder = Workorder.last(5)
    if current_user.role == 'janitor'
      redirect_to '/workorders'
    end
  end
end
