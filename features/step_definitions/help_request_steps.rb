Given(/^the following help request messages exist$/) do |table|
  table.hashes.each do |hash|
    create(:help_request, title: hash[:title], message: hash[:message], urgent: hash[:urgent])
  end
end

Given(/^I am on the show help request page$/) do
  visit help_requests_path
end
