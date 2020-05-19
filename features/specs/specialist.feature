# language: en

Feature: Go to the specialist's page and view more details about him.

@happylogin @specialist @clear
Scenario: Choose an expert and view his details.
  When you click on the tab our specialists.
  And click on the first professional on the list.
  Then I must go to your page and see more information about specialist