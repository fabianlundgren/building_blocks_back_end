Given(/^I am on the root page$/) do
  visit root_path
end

Given(/^I click link "([^"]*)"$/) do |link|
  click_link link
end

Given(/^I am on the registration page$/) do
  visit new_user_registration_path
end
