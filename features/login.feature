Feature: LOGIN
  In order to access the system
  As an admin or developer
  I want to login

  Scenario: Admin Login
    Given I am on the login page
    When I input my admin email and password
    Then I click the "login" button
    And I should see homepage

  Scenario: Developer Login
    Given I am on the login page
    When I input my developer email and password
    Then I click the "login" button
    And I should see homepage
