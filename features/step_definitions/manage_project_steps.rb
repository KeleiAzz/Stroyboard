Given(/^I am on the project page as an admin$/) do
  visit projects_path
end

When(/^I click the "New Project" button$/) do
  click_button "New Project"
end

When(/^I click the "Edit" button$/) do
  click_button "Edit"
end

Then(/^I fill the form and click "Update Project" button$/) do
  fill_in "project[name]", :with => "TestProject"
  fill_in "project[description]", :with => "SomeDescription"
  click_button "Update Project"
end

Then(/^The project should be updated successfully$/) do
  assert_equal "Project was successfully updated.", flash[:notice]
end

Then(/^I fill the form and click "Create Project" button$/) do
  fill_in "project[name]", :with => "TestProject"
  fill_in "project[description]", :with => "SomeDescription"
  click_button "Create Project"
end

Then(/^A new project is created successfully$/) do
  assert_equal "Project was successfully created.", flash[:notice]
end