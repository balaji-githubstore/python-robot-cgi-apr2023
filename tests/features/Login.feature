@login
Feature: Login
  In order to maintain the employees records
  As an admin
  I want to access the HR management portal

  Background:
       Given I have browser with orange hrm application

  @valid
  Scenario: Valid Login
    When I enter username as "Admin"
    And I enter password as "admin123"
    And I click on login
    Then I want to access dashboard page with header "Dashboard"

#    @invalid @smoke
#    Scenario: Invalid Login
#    Given I have browser with orange hrm application
#    When I enter username as "john"
#    And I enter password as "john123"
#    And I click on login
#    Then I should not get access to dashboard page with error "Invalid credentials"

  @invalid @smoke
  Scenario Outline: Invalid Login
    When I enter username as "<username>"
    And I enter password as "<password>"
    And I click on login
    Then I should not get access to dashboard page with error "<expected_error>"
    Examples:
      | username | password | expected_error      |
      | saul     | saul123  | Invalid credentials |
      | peter    | peter123 | Invalid credentials |