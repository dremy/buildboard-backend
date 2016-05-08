Feature: TFA Department
  As an author,
  I want to create a department
  So that a site visitor can view a list of departments

  @api @tfa @tfa-content @tfa-departments
  Scenario: Create an department node and view it
    Given I am logged in as a user with the "system administrator" role
    When I visit "/node/add/departments"
    Then I should see the heading "Create Departments"
    And I fill in the following:
      | Name       | A Typical Department Page |
      | Description        | Vestibulum id ligula porta felis euismod semper. |
      | Address  | 123 Test Rd., Alexandria, VA 22222 |
      | Telephone       | 555-555-5555 |
    When I press "Save"
    Then I should see "A Typical Department Page"
    Then I should see "Vestibulum id ligula porta felis euismod semper."
    Then I should see "123 Test Rd."
    Then I should see "Alexandria, VA 22222"
    Then I should see "555-555-5555"
  @api @tfa @tfa-content @tfa-departments
  Scenario: View a list of departments
    Given I am logged in as a user with the "system administrator" role
    When I visit "/list/departments"
    Then I should see the heading "Department Listing"
    Then I should see "Search"