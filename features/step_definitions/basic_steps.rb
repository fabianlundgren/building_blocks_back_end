Given(/^I am on the create news post page$/) do
  visit new_news_path
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
 fill_in field, with: content
end

Then(/^I click "([^"]*)"$/) do |button|
  click_button button
end

Then(/^show me the page$/) do
 save_and_open_page
end

Given(/^I should not see "([^"]*)"$/) do |content|
  expect(page).not_to have_content content
end

Given(/^I am on the index page$/) do
  visit root_path
end

Given(/^the following users exist$/) do |table|
  table.hashes.each do |hash|
   create(:user, hash)
  end
end

Given(/^I am logged in as "([^"]*)"$/) do |email|
  user = User.find_by(email: email)
  login_as(user, scope: :user)
end
