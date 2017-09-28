json.name @facility.name
json.description @facility.description
json.rules @facility.rules
json.bok_dur @facility.bok_dur
book = Booking.where(user_id: current_user)
json.count book.count(:all)
if book.count(:all) < 3
  json.max2 'max'
else
  json.min2 'min'
end
