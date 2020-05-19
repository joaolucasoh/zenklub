# language: en

Feature: Log in correctly on the portal.

@login
Scenario Outline: Log in correctly with valid credentials
    When I am on the portal and enter with '<email>' and '<password>'
    Then you should log in normally
    And should not have any session scheduled viewing this '<message>'
    Examples:
        | email                   | password    | message                                                                                  |
        | qachallenge@zenklub.com | qachallenge | Você ainda não fez nenhuma sessão. Encontre o profissional perfeito para você ainda hoje |
