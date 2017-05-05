class Api::V1::FacilitiesController < ApiController
  def index
    @facilities = Facility.all
  end

  def show
    begin
      @facility = Facility.find(params[:id])
    rescue => error
      render json: { message: error}, status: 404
    end
  end
end
