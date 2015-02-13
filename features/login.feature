Feature: LOGIN
  In order to access the system
  As an admin or developer
  I want to login

  Scenario: Admin Login
    Given I am an admin
    When I go to the login page
    Then I input my email and password
    And I should see homepage
