class Api::V1::BookingsController < ApiController
  def index
    @facility = Facility.find(params[:facility_id])
  end

  def create
    @booking = Booking.new booking_params
    @booking.facility_id = params[:facility_id]
    if @booking.name == nil
      render json: {message: @booking.errors.full_messages}, status: 400
    elsif @booking.save
      render json: {message: 'Your booking has been saved'}
    else
      render json: {message: @booking.errors.full_messages}, status: 400
    end
  end

  private
  def booking_params
    params.permit(:name, :start_time , :id, :building_id)
  end
end
