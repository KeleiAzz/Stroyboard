Given(/^I am on the login page$/) do
  visit login_path
end

When(/^I input my admin email and password$/) do
  fill_in "session[email]", :with => "Admin1@ncsu.edu"
  fill_in "session[password]", :with => "Password"
end

When(/^I input my developer email and password$/) do
  fill_in "session[email]", :with => "Developer1@ncsu.edu"
  fill_in "session[password]", :with => "Password"
end

Then(/^I click the "login" button$/) do
  click_button "Log in"
end

Then(/^I should see homepage$/) do
  assert_equal '/home', current_path
end
