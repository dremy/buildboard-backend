Feature: Content Type: Opportunity
  As an author
  I want to publish opportunities
  so that a site visitor can find TFA opportunities and apply.

  @api @javascript @tfa @tfa-content @tfa-opportunity
  Scenario: Create a Opportunity node
    Given I am logged in as a user with the "system administrator" role
    When I visit "/node/add/opportunity"
    Then I should see the heading "Create Opportunity"
    And I click "Switch to plain text editor"
    And I fill in the following:
      | Title           | Barista                                   |
      | City            | Portland                                  |
      | State           | OR                                        |
      | Job Description | Make coffee for a city that loves coffee! |
      | URL             | http://starbucks.com                      |
    And I press the "Next page" button
    And I create the following "More info" field collections
      | Title        | More information                                                |
      | Pay          | Minimal                                                         |
      | Requirements | Ability to put up with uncaffienated and overcaffienated people |
    And I press "Save"
    Then I should see "Barista"
    And I should see "Portland"
    And I should see "OR"
    And I should see "Make coffee for a city that loves coffee!"
    And the link "Apply" in the "Main Content" region should go to "http://starbucks.com"
    And I should see "Pay"
    And I should see "Minimal"
    And I should not see "Ability to put up with uncaffienated and overcaffienated people"
    When I click "Requirements"
    And I should see "Ability to put up with uncaffienated and overcaffienated people"
    And I should not see "Minimal"
