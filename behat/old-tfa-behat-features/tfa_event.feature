Feature: TFA Blog
  As an author,
  I want to create an event
  So that a site visitor can read about an event from Teach for America

  @api @tfa @tfa-content @tfa-event
  Scenario: Create an event node and view it
    Given I am logged in as a user with the "system administrator" role
    When I visit "/node/add/event"
    Then I should see the heading "Create Event"
    And I fill in the following:
      | Title       | A Crazy Event |
      | Description        | Fusce elit mi, feugiat vitae libero nec, malesuada semper nibh. |
      | Address   | 123 Test Rd., Alexandria, VA 22222 |
    When I press "Save"
    Then I should see "A Crazy Event"
    Then I should see "Fusce elit mi, feugiat vitae libero nec, malesuada semper nibh."
    Then I should see "123 Test Rd."
    Then I should see "Alexandria, VA 22222"
