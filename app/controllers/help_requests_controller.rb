class HelpRequestsController < ApplicationController
  def index
    @help_requests = HelpRequest.last(20)
  end

  def destroy
    @help_request = HelpRequest.find(params[:id])
    if @help_request.destroy
      flash[:notice] = "Help Request Deleted!"
      redirect_back(fallback_location: help_requests_path)
    end
  end
end
