json.array! @facility.timeslots.each do |timeslot|
  book = Booking.where(user_id: current_user)
  json.count book.count(:all)
  if book.count(:all) < 3
    json.max 'max'
  else
    json.min 'min'
  end
  if @bookings.find_by(start_time: "#{@date} #{timeslot.start_time}") == nil
    json.start_time timeslot.start_time
    json.end_time timeslot.end_time
  else
    booking = @bookings.find_by(start_time: "#{@date} #{timeslot.start_time}")
    if booking == nil
    else
      json.name booking.name
    end
    json.bookt 'Booked'
    json.start_time timeslot.start_time
    json.end_time timeslot.end_time
  end
end
