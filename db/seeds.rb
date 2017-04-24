News.delete_all

News.create(title: "Party", description: "Awesome party")
News.create(title: "Grill", description: "Awesome grill")
News.create(title: "Sauna", description: "Sauna is broken")
News.create(title: "Bill",  description: "Bill has moved out, yay!")
News.create(title: "Johan", description: "Has been evicted")
News.create(title: "Casper", description: "Has no pants because of pants fire")
News.create(title: "Playground", description: "Playground is being repaired")
News.create(title: "Cleaning", description: "Time for spring cleaning!")

Facility.create(name: "Sauna", description: "Awesome sauna", rules: "No underwear")
Facility.create(name: "Laundry", description: "Awesome laundry room", rules: "Leave it as you found it")
Facility.create(name: "Roof terrace", description: "Sunny terrace", rules: "No smoking")
Facility.create(name: "Backyard", description: "Backyard with barbecue", rules: "No dogs allowed")

HelpRequest.create(title: "Help broken window", message: "Hosue is destroyed", urgent: true)
HelpRequest.create(title: "Help broken car", message: "Car is destroyed", urgent: true)
HelpRequest.create(title: "Help wet dog smell", message: "Lift smell of wet dog", urgent: false)
HelpRequest.create(title: "Broken cat", message: "Call doctor", urgent: false)
HelpRequest.create(title: "Windows needs cleaning", message: "Clean my windows", urgent: false)
HelpRequest.create(title: "Help broken dorr", message: "lockt in", urgent: true)

puts "Created #{News.count} news"
puts "Created #{Facility.count} facilities"
puts "Created #{HelpRequest.count} help_request"
