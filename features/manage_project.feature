Feature: MANAGE PROJECT
  In order to manage project
  As an admin
  I want to create/delete/edit project

  Scenario: Create Project
    Given I am on the project page
    When I click the "New Project" button
    Then I fill the form and click "Create Project" button
    And A new project is created successfully

  Scenario: Edit Project
    Given I am on the project page
    When I click the "Edit" button
    Then I fill the form and click "Update Project" button
    And The project should be updated successfully