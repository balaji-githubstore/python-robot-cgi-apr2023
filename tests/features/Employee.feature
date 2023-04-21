Feature: Employee
  In order to maintain the employees records
  As an admin
  I want to add,update, delete records

  @addemployee
  Scenario Outline: Add Valid Employee
    Given I have browser with orange hrm application
    When I enter username as "<username>"
    And I enter password as "<password>"
    And I click on login
    And I click on PIM Menu
    And I click on Add Employee
    And I fill the employee records
      | first_name | middle_name | last_name  |
      | <fname>    | <mname>     | <lastname> |
    And I click on save
    Then I should get profile name as "<fname> <lastname>"
    Examples:
      | username | password | fname | mname | lastname |
      | Admin    | admin123 | jack  | k     | kevin    |
      | Admin    | admin123 | saul  | k     | goodman  |
