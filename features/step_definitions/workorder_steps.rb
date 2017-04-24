Then(/^I check Urgent check box$/) do
  check 'workorder_urgent'
end

Then(/^I should see "([^"]*)" in field "([^"]*)"$/) do |value, field|
  expect(find_field(field).value).to eq value
end
