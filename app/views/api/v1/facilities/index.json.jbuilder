json.array! @facilities.each do |facility|
    json.id facility.id
    json.name facility.name
    json.description facility.description
    json.rules facility.rules
    json.status facility.status
    book = Booking.where(facility_id: facility.id, user_id: current_user.id)
    if book == nil
    else
      json.count book.count(:all)
    end
end
