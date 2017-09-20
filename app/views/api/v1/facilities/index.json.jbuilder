json.array! @facilities.each do |facility|
    json.id facility.id
    json.name facility.name
    json.description facility.description
    json.rules facility.rules
    json.status facility.status
    book = Booking.find_by(facility_id: facility.id, user_id: current_user.id)
    if book == nil
    else
      json.book book.id
    end
end
