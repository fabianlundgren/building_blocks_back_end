Given(/^the following news exist$/) do |table|
  table.hashes.each do |hash|
    create(:news, title: hash[:title], description: hash[:description])
  end
end
