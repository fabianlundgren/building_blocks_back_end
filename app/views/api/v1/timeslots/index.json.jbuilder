json.array! @facility.timeslots.each do |timeslot|
  book = Booking.where(user_id: current_user)
  json.count book.count(:all)
  if book.count(:all) < 3
    json.max 'max'
  else
    json.min 'min'
  end
    start_date = "#{@date} #{timeslot.start_time}".to_time + 1
    end_date = "#{@date} #{timeslot.end_time}".to_time - 1
    if @bookings.find_by(['start_time BETWEEN ? AND ?', "#{@date} #{timeslot.start_time}", end_date.to_s,]) == nil && @bookings.find_by(['end_time  BETWEEN ? AND ?', start_date.to_s ,"#{@date} #{timeslot.end_time}",]) == nil
      json.start_time timeslot.start_time
      json.end_time timeslot.end_time
    else
      booking = @bookings.find_by(['start_time BETWEEN ? AND ?', "#{@date} #{timeslot.start_time}", "#{@date} #{timeslot.end_time}",])
      if booking == nil

      else
        json.name booking.name
        json.bookt 'Booked'
        json.start_time booking.start_time.strftime("%H:%M:%S")
        json.end_time booking.end_time.strftime("%H:%M:%S")
        json.ids booking.id
      end
  end
end
