class Api::V1::TimeslistsController < ApiController
  def show
    begin
      @timelists = Timelist.where(facility_id: params[:facility_id])
      @bookings = Booking.where(facility_id: params[:facility_id])
    rescue => error
      render json: { message: error}, status: 404
    end
  end
end
