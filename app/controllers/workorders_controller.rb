class WorkordersController < ApplicationController
  def new
    @workorder = Workorder.new
    if params[:format]
      @help_requests = HelpRequest.find(params[:format])
    end
  end

  def create
    @workorder = Workorder.new workorder_params
    if @workorder.save
      flash[:notice] = "New work order sent !!"
      redirect_back(fallback_location: new_workorder_path)
    end
  end

  private

  def workorder_params
    params.require(:workorder).permit(:title, :message, :location, :urgent)
  end
end
