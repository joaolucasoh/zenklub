# language: en

Feature: Go to the specialist's page and view more details about him.

Background: To click to create a new account
    When you click to Create a new account

@wrong_signup
Scenario: Create a new user without filling in the fields correctly.
  And do not fill in the mandatory fields
  Then in each field there will be a mandatory alert

@successfully
Scenario: Create a new user with all fields correctly
    And fill in all the fields correctly
    Then I am redirected to the home page.