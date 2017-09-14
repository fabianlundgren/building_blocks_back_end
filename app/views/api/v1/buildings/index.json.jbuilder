json.array! @building.each do |building|
    json.id building.id
    json.name building.name
end
