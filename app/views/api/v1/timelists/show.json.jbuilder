json.array! @facility.timelists.each do |timelist|
  json.time timelist.time.strftime("%H:%M:%S")
  json.value timelist.time.strftime("%H:%M:%S")
end
