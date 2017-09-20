json.id @building.id
json.name @building.name
book = Booking.find_by(user_id: current_user.id)
if book == nil
else
  json.book book.id
end
