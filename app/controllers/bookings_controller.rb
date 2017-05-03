class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_facility, only: [:index, :new, :show, :edit, :create]

  def index
    @bookings = @facility.bookings
  end

  def show
  end

  def new
    @facility = Facility.find(params[:facility_id])
    @date = params[:date]
    @bookings = Booking.where(facility_id: params[:facility_id])
  end

  def edit
  end

  def create
    @booking = Booking.new(start_time: params[:date],name: 'tester',facility_id: params[:facility_id])
    #Change name tester to username

    respond_to do |format|
      if @booking.save
        format.html { redirect_to facility_booking_path(@facility, @booking) , notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to facility_bookings_path, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:name, :start_time)
    end
end
