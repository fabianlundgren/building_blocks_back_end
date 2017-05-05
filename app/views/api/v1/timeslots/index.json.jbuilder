json.array! @facility.timeslots.each do |timeslot|
  if @bookings.find_by(start_time: "#{@date} #{timeslot.start_time}") == nil
    json.start_time timeslot.start_time
    json.end_time timeslot.end_time
  else
    json.bookt 'Booked'
    json.start_time timeslot.start_time
    json.end_time timeslot.end_time
  end
end
